defmodule Guildship.Administration do
  use Guildship

  @doc """
  Makes a user an admin.
  Trying to make an admin an admin again will not pass validation.
  """
  def make_user_admin(user) do
    %Administration.Admin{}
    |> Administration.Admin.new_changeset(%{user_id: user.id})
    |> Repo.insert()
  end

  @doc """
  Removes an admin.
  """
  def remove_admin(%Administration.Admin{} = admin) do
    Repo.delete(admin)
  end
end
