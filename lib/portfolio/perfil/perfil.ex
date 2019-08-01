defmodule Portfolio.Perfil do 
    use Ecto.Schema
    import Ecto.Changeset
    alias Portfolio.Usuario

    schema("perfis") do 
        field :nome, :string 
        field :sexo, :integer
        field :pais, :string
        field :profissao, :string
        field :cidade, :string
        field :estado, :string
        field :data_nascimento, :string
        field :avatar, :string
        field :celular, :string
        belongs_to :user_id, Usuario

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:nome, :sexo, :pais, :profissao, :cidade, :estado, :data_nascimento, :avatar, :celular])
        |> validate_required([:nome, :sexo, :data_nascimento, :celular])
    end
end
