defmodule Bot.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :id_message, :string
      add :message, :string

      timestamps()
    end

  end
end
