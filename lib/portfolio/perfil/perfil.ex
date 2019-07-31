defmodule Portfolio.Perfil do 
    use Ecto.Schema
    import Ecto.Changeset
    alias Portfolio.Usuario

    schema("perfis") do 
        field :nome, :string 
        field :sexo, :boolean
        field :pais, :string
        field :profissao, :string
        field :cidade, :string
        field :data_nascimento, :string
        field :avatar, :string
        belongs_to :user_id, Usuario

        timestamps()
    end
end
