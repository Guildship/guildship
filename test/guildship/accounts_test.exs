defmodule Guildship.AccountsTest do
  use Guildship
  use Guildship.DataCase

  describe "users" do
    alias Guildship.Accounts.User

    @valid_attrs %{username: "username_3"}
    @update_attrs %{
      username: "username_2"
    }
    @invalid_attrs %{discriminator: 1234, username: ""}

    test "list_users/0 returns all users" do
      %User{id: user_id} = insert(:user)
      assert [%User{id: ^user_id}] = Accounts.list_users()
    end

    test "get_user!/1 returns the user with given id" do
      %User{id: user_id} = insert(:user)
      assert %User{id: ^user_id} = Accounts.get_user!(user_id)
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %{user: %User{} = user}} = Accounts.create_user(@valid_attrs)
      assert is_nil(user.discriminator) == false
      assert user.username == "username_3"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, :user, %Ecto.Changeset{}, _transaction} =
               Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      %User{discriminator: original_discriminator} = user = insert(:user)
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.discriminator == original_discriminator
      assert user.username == "username_2"
    end

    test "update_user/2 with invalid data returns error changeset" do
      %User{id: user_id} = user = insert(:user)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert %User{id: ^user_id} = Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = insert(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = insert(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
