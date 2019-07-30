defmodule PortfolioWeb.AuthController do
    use PortfolioWeb, :controller
    alias Portfolio.{Usuario, Repo}
    plug Ueberauth

    def index(conn, _params) do
        render(conn, "index.html")
    end
end