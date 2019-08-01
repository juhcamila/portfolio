defmodule PortfolioWeb.PerfilController do
    use PortfolioWeb, :controller
    import Ecto.Repo
    alias Portfolio.{Perfil, Repo}

    def index(conn, _params) do 
        render(conn, "index.html")
    end

    def new(conn, _params) do
        changeset = Perfil.changeset(%Perfil{})
        render conn, "new.html", changeset: changeset
    end
end