defmodule Creep.GuardianSerializer do
  @behavior Guardian.Serializer

  alias Creep.{Repo, User}

  def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, Ecto.UUID.dump(id))}
  def from_token(_), do: {:error, "Unknown resource type"}

end
