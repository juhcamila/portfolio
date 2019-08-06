defmodule PortfolioWeb.PerfilController do
    use PortfolioWeb, :controller
    import Ecto.Repo
    alias Portfolio.{Perfil, Repo, Usuario}

    def index(conn, _params) do 
        render(conn, "index.html")
    end

    def show(conn, params) do
        perfil = Repo.get_by(Perfil, usuario_id: conn.assigns.user.id)
        render conn, "show.html", perfil: perfil
    end

    def new(conn, _params) do
        changeset = Perfil.changeset(%Perfil{})
        render conn, "new.html", changeset: changeset
    end
    
    def create(conn, %{"perfil" => perfil}) do
        changeset =
        conn.assigns.user
        |> Ecto.build_assoc(:perfis)
        |> Perfil.changeset(perfil)
        case Repo.insert changeset do
            {:ok, struct} ->
                conn
                |> redirect(to: Routes.perfil_path(conn, :show))
            {:error, changeset} -> 
                render conn, "new.html", changeset: changeset     
        end
    end

    def edit(conn, %{"id" => id}) do 
        perfil = Repo.get!(Perfil, id)
        changeset = Perfil.changeset(perfil)
        render conn, "edit.html", changeset: changeset, perfil: perfil
    end

    def update(conn, %{"perfil" => perfil, "id" => id}) do 
        perfil_alterar = Repo.get!(Perfil, id)
        changeset = Perfil.changeset(perfil_alterar, perfil)

        case Repo.update(changeset) do 
            {:ok, struct} ->
                conn
                |> put_flash(:info, "Perfil alterado com sucesso!")
                |> redirect(to: Routes.perfil_path(conn, :show))
            {:error, changeset} -> 
                render conn, "edit.html", changeset: changeset, perfil: perfil_alterar         
        end
    end

    def delete(conn, %{"id" => id}) do 
        perfil = Repo.get!(Perfil, id)
        user = Repo.get!(Usuario, perfil.usuario_id)
        Repo.delete!(perfil)
        Repo.delete!(user)

        conn
        |> put_flash(:info, "Conta deletada com sucesso!")
        |> redirect(to: Routes.page_path(conn, :index))
    end

end