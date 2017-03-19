defmodule BookParty.Repo.Migrations.CreateParty do
  use Ecto.Migration

  def change do
    create table(:parties) do

      timestamps()
    end

  end
end
