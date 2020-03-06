defmodule Guildship.Guilds.CalendarEvent do
  use Guildship.Schema

  schema "guild_calendar_event" do
    field :title, :string
    field :description, :string
    field :starts_at, :utc_datetime
    field :ends_at, :utc_datetime
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild
    belongs_to :author, User
  end
end
