defmodule Bot.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :id_message, :string
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:id_message, :message])
    |> validate_required([:id_message, :message])
  end
end
