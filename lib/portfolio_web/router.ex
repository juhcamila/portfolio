defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PortfolioWeb.Plug.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PortfolioWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/auth", PortfolioWeb do 
    pipe_through :browser

    get "/", AuthController, :index
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    get "/:provider/logout", AuthController, :logout
  end

  scope "/perfil", PortfolioWeb do
    pipe_through :browser

    get "/home", PerfilController, :show
    resources("/", PerfilController, except: [:show])
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortfolioWeb do
  #   pipe_through :api
  # end
end
