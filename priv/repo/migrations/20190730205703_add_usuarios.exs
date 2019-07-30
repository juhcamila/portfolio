defmodule Portfolio.Repo.Migrations.AddUsuarios do
  use Ecto.Migration

  def change do
    create table :usuarios do
      add :nome, :string
      add :email, :string
      add :senha, :string
      add :provider, :string
      timestamps()
    end
  end
end
