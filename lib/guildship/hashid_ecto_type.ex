defmodule Guildship.HashidEctoType do
  use Ecto.Type
  alias Guildship.Hashid

  def type, do: :serial

  def cast(hashid) when is_binary(hashid) do
    val = Hashid.decode(hashid)

    {:ok, val}
  end

  def cast(_), do: :error

  def load(val) when is_integer(val) do
    hashid = Hashid.encode(val)

    {:ok, hashid}
  end

  def load(_), do: :error

  def dump(val) when is_integer(val), do: {:ok, val}
  def dump(_), do: :error
end
