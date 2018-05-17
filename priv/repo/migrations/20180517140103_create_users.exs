defmodule Bot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :screen_name, :string
      add :phone_number, :string
      add :psid, :string
      add :correo, :string
      add :project, :string

      timestamps()
    end

  end
end
