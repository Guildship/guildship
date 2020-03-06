defmodule Guildship.Guilds.CalendarEvent do
  use Guildship.Schema

  schema "guild_calendar_event" do
    belongs_to :entity, Entity
    belongs_to :guild, Guilds.Guild
  end
end
