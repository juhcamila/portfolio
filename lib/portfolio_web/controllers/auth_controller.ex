defmodule PortfolioWeb.AuthController do
    use PortfolioWeb, :controller
    alias Portfolio.{Usuario, Repo}
    plug Ueberauth

    def index(conn, _params) do
        render(conn, "index.html")
    end

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider}) do  
        usuario = %{email: auth.info.email, senha: auth.credentials.token, provider: provider}
        changeset = Usuario.changeset(%Usuario{}, usuario)
        logar conn, changeset
    end

    defp logar(conn, changeset) do
        case insere_ou_busca(changeset) do
            {:ok, usuario} ->
                conn
                |> put_flash(:info, "Você esta logado!")
                |> put_session(:user_id, usuario.id)
                |> redirect(to: Routes.perfil_path(conn, :index))
            {:error, _razao} ->
                conn
                |> put_flash(:error, "Houve um problema na requisição!")
                |> redirect(to: Routes.page_path(conn, :index))    
        end
    end

    defp insere_ou_busca(changeset) do 
        case Repo.get_by(Usuario, email: changeset.changes.email) do 
            nil -> Repo.insert changeset
            usuario -> {:ok, usuario}
        end
    end
end