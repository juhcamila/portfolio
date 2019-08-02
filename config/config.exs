# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :portfolio,
  ecto_repos: [Portfolio.Repo]

# Configures the endpoint
config :portfolio, PortfolioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cQQD9girCG/EZB5JVMWP+de2jl98cbzxWlsAOr/cYQ/8ebOnN+/d/FMrkHzQSQnA",
  render_errors: [view: PortfolioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Portfolio.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [allow_private_emails: true, default_scope: "user,user:email,public_repo,notifications"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "Iv1.4193d44d28f052a9",
  client_secret: "b3a939a115d32fc7b1a7c224b6b7ccd001b8acde"

config :arc,
  storage: Arc.Storage.S3, # or Arc.Storage.Local
  bucket: {:system, "AWS_S3_BUCKET"} # if using Amazon S3

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
