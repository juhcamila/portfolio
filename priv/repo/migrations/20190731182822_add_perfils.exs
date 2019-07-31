defmodule Portfolio.Repo.Migrations.AddPerfils do
  use Ecto.Migration

  def change do
    create table :perfis do 
      add :user_id, references(:usuarios)
      add :nome, :string
      add :sexo, :boolean
      add :profissao, :string
      add :pais, :string
      add :cidade, :string
      add :data_nascimento, :string
      add :avatar, :string

      timestamps()
    end
  end
end
