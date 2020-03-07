defmodule Guildship.Factory do
  use Guildship
  use ExMachina.Ecto, repo: Repo

  def user_factory do
    %Accounts.User{
      username: sequence(:username, &"cool_user_#{&1}"),
      discriminator: 0..9999 |> Enum.random()
    }
  end

  def admin_factory do
    %Administration.Admin{
      user: build(:user)
    }
  end

  def entity_factory do
    %Entities.Entity{}
  end

  def entity_tag_factory do
    %Entities.Tag{
      name: Faker.Lorem.word(),
      entity: build(:entity)
    }
  end

  def entity_reaction_factory do
    %Entities.Reaction{
      entity: build(:entity),
      user: build(:user)
    }
  end

  def entity_report_factory do
    %Entities.Report{
      entity: build(:entity),
      user: build(:user),
      reason: Faker.Lorem.paragraphs(1..3) |> Enum.join("\n\n")
    }
  end

  def guild_factory do
    %Guilds.Guild{
      name: Faker.Team.name() |> Recase.to_title(),
      entity: build(:entity)
    }
  end

  def guild_membership_factory do
    %Guilds.Membership{
      user: build(:user),
      guild: build(:guild)
    }
  end

  def guild_forum_category_factory do
    %Guilds.ForumCategory{
      name: Faker.Lorem.word(),
      guild: build(:guild),
      entity: build(:entity)
    }
  end

  def guild_forum_thread_factory do
    %Guilds.ForumThread{
      title: Faker.Lorem.sentence() |> Recase.to_title(),
      forum_category: build(:guild_forum_category),
      entity: build(:entity),
      user: build(:user)
    }
  end

  def guild_forum_thread_reply_factory do
    body_raw = "# I'm a heading! Woaaah!"
    body_html = body_raw |> Markdown.markdown_to_clean_html!()

    %Guilds.ForumThreadReply{
      entity: build(:entity),
      user: build(:user),
      forum_thread: build(:guild_forum_thread),
      body_raw: body_raw,
      body_html: body_html
    }
  end

  def guild_calendar_event_factory do
    description_raw = "# I'm a heading! Woaaah!\n\nhttps://example.com"
    description_html = description_raw |> Markdown.markdown_to_clean_html!()

    %Guilds.CalendarEvent{
      entity: build(:entity),
      guild: build(:guild),
      author: build(:user),
      title: Faker.Lorem.sentence(4..10, "!") |> Recase.to_title(),
      description_raw: description_raw,
      description_html: description_html,
      starts_at: NaiveDateTime.utc_now(),
      ends_at: Faker.NaiveDateTime.forward(1)
    }
  end

  def guild_news_post_factory do
    body_raw = "# I'm a heading! Woaaah!"
    body_html = body_raw |> Markdown.markdown_to_clean_html!()

    %Guilds.NewsPost{
      entity: build(:entity),
      guild: build(:guild),
      author: build(:user),
      title: Faker.Lorem.sentence() |> Recase.to_title(),
      body_raw: body_raw,
      body_html: body_html
    }
  end

  def guild_wiki_page_factory do
    body_raw = "# I'm a heading! Woaaah!"
    body_html = body_raw |> Markdown.markdown_to_clean_html!()

    %Guilds.WikiPage{
      entity: build(:entity),
      guild: build(:guild),
      title: Faker.Lorem.sentence() |> Recase.to_title(),
      body_raw: body_raw,
      body_html: body_html
    }
  end
end
