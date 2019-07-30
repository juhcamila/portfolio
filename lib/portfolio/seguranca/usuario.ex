defmodule Portfolio.Usuario do
    use Ecto.Schema
    import Ecto.Changeset

    schema "usuarios" do
        field :nome, :string
        field :email, :string
        field :senha, :string
        field :provider, :string
        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:nome, :email, :senha, :provider])
        |> validate_required([ :email, :senha, :provider])
    end
end