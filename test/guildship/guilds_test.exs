defmodule Guildship.GuildsTest do
  use Guildship
  use Guildship.DataCase

  describe "guilds" do
    test "list_guilds/0 gives a list of guilds if there are any" do
      insert_list(4, :guild)

      assert Guilds.list_guilds() |> Enum.count() == 4
    end
  end
end
