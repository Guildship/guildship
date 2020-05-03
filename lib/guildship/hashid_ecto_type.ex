defmodule Guildship.HashidEctoType do
  use Ecto.Type
  alias Guildship.Hashid

  @doc "The Ecto type."
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

  def dump(val) when is_binary(val) do
    id = Hashid.decode(val)
    {:ok, id}
  end

  def dump(_), do: :error
end
