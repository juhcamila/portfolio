defmodule Portfolio.Repo.Migrations.AddPerfils do
  use Ecto.Migration

  def change do
    create table :perfis do 
      add :usuario_id, references(:usuarios)
      add :nome, :string
      add :sexo, :integer
      add :profissao, :string
      add :pais, :string
      add :cidade, :string
      add :estado, :string
      add :data_nascimento, :string
      add :celular, :string
      add :avatar, :string

      timestamps()
    end
  end
end
