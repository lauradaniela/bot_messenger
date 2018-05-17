defmodule Bot.Clients.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :correo, :string
    field :phone_number, :string
    field :project, :string
    field :psid, :string
    field :screen_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:screen_name, :phone_number, :psid, :correo, :project])
    |> validate_required([:psid])
  end
end
