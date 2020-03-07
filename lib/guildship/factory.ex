defmodule Guildship.Factory do
  use Guildship
  use ExMachina.Ecto, repo: Repo

  def user_factory do
    %Accounts.User{
      username: Faker.Internet.user_name()
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
      body: Faker.Lorem.paragraphs(1..3) |> Enum.join("\n\n")
    }
  end
end
