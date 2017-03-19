defmodule BookParty.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :email, :string

      timestamps()
    end

  end
end
