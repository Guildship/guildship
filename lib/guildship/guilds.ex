defmodule Guildship.Guilds do
  @moduledoc """
  The Guilds context.
  """

  use Guildship
  import Ecto.Query

  def create_guild() do
  end

  def list_guilds() do
    Guilds.Guild
    |> Repo.all()
  end

  def delete_guild() do
  end

  def change_guild_name() do
  end

  def join_guild() do
  end

  def leave_guild() do
  end

  def create_news_post() do
  end

  def edit_news_post() do
  end

  def react_to_news_post() do
  end

  def delete_news_post() do
  end

  def list_forum_categories(guild_id) do
    query =
      from c in Guilds.ForumCategory, where: c.guild_id == ^guild_id, order_by: c.inserted_at

    Repo.all(query)
  end

  def get_forum_category(category_id) do
    Repo.one!(from c in Guilds.ForumCategory, where: c.id == ^category_id)
  end

  def create_forum_category() do
  end

  def delete_forum_category() do
  end

  def edit_forum_category() do
  end

  def get_forum_threads_in_category(category_id) do
    Repo.all(
      from t in Guilds.ForumThread,
        where: t.forum_category_id == ^category_id,
        order_by: [desc: t.inserted_at]
    )
  end

  def create_forum_thread() do
  end

  def edit_forum_thread() do
  end

  def count_forum_thread_replies(query) do
    from t in query,
      group_by: t.id,
      left_join: r in assoc(t, :forum_thread_replies),
      select: {t, count(r.id)}
  end

  def get_forum_thread_replies_in_thread(thread_id) do
    from(t in Guilds.ForumThread, where: t.id == ^thread_id)
    |> count_forum_thread_replies()
    |> Repo.all()
  end

  def delete_forum_thread() do
  end

  def create_forum_thread_reply() do
  end

  def edit_forum_thread_reply() do
  end

  def delete_forum_thread_reply() do
  end

  def react_to_forum_thread_reply() do
  end

  def create_calendar_event() do
  end

  def edit_calendar_event() do
  end

  def delete_calendar_event() do
  end

  def react_to_calendar_event() do
  end

  def rsvp_to_calendar_event() do
  end
end
