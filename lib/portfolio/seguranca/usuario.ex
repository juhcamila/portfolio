defmodule Portfolio.Usuario do
    use Ecto.Schema
    import Ecto.Changeset
    alias Portfolio.Perfil

    schema "usuarios" do
        field :email, :string
        field :senha, :string
        field :provider, :string
        has_one :perfis, Perfil
        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:email, :senha, :provider])
        |> validate_required([ :email, :senha, :provider])
    end
end