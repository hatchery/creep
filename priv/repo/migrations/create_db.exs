defmodule Creep.Repo.Migrations.CreateDB do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :email, :string, null: false
      add :encrypted_password, :string, null: false

      timestamps
    end

    create table(:boards, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps
    end

    create index(:board, [:user_id])
    create unique_index(:users, [:email])
  end
end
