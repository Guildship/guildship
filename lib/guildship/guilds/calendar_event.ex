defmodule Guildship.Guilds.CalendarEvent do
  use Guildship.Schema

  schema "guild_calendar_event" do
    field :title, :string
    field :description_raw, :string
    field :description_html, :string
    field :starts_at, :naive_datetime
    field :ends_at, :naive_datetime
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild
    belongs_to :author, User

    timestamps()
  end
end
