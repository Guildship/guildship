defmodule Guildship.Entities do
  use Guildship
  import Ecto.Query

  @moduledoc """
  The Entities context.
  """

  @doc """
  Creates a Multi with an :entity attached, ready for a Multi.insert() for content
  """
  def create_entity_multi(struct, attrs, fun, opts \\ [])
      when is_struct(struct) and is_map(attrs) and is_function(fun) do
    Multi.new()
    |> Multi.insert(:entity, %Entities.Entity{})
    |> Multi.merge(fn %{entity: entity} ->
      attrs = attrs |> Map.put(Keyword.get(opts, :entity_id_key, :entity_id), entity.id)

      Multi.new()
      |> Multi.insert(Keyword.get(opts, :content_key, :content), fun.(struct, attrs))
    end)
    |> Repo.transaction()
  end

  def create_entity_multi() do
  end

  @doc """
  Adds a reaction to an entity.
  """
  def react_to_entity() do
  end

  @doc """
  Removes a reaction from an entity.
  """
  def remove_entity_reaction() do
  end

  @doc """
  Reports an entity to the admins.
  """
  def report_entity() do
  end

  @doc """
  Lists all reports and the associated content
  """
  def list_reports() do
    Entities.Report
    |> preload(entity: [:guild, :guild_news_post, :guild_forum_thread_reply])
    |> Repo.all()
  end
end
