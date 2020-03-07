defmodule Guildship.AdministrationTest do
  use Guildship
  use Guildship.DataCase

  describe "admins" do
    test "make_user_admin/1 makes a user an admin" do
      user = insert(:user)

      assert {:ok, %Administration.Admin{}} = Administration.make_user_admin(user)
    end

    test "remove_admin/1 removes an admin" do
      admin = insert(:admin)
      Administration.remove_admin(admin)
      admins = Repo.all(Administration.Admin)
      assert Enum.count(admins) == 0
    end

    test "get_all_admins/0 returns an empty list if there are no admins" do
      admins = Administration.get_all_admins()
      assert Enum.count(admins) == 0
    end

    test "get_all_admins/0 returns all admins" do
      %Administration.Admin{id: admin_id} = insert(:admin)
      admins = Administration.get_all_admins()
      assert [%Administration.Admin{id: ^admin_id}] = admins
    end
  end
end
