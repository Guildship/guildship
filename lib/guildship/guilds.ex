defmodule Guildship.Guilds do
  @moduledoc """
  The Guilds context.
  """

  use Guildship

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

  def create_forum_category() do
  end

  def delete_forum_category() do
  end

  def edit_forum_category() do
  end

  def create_forum_thread() do
  end

  def edit_forum_thread() do
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
