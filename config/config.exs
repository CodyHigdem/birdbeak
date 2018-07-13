# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :birdbeak,
  ecto_repos: [Birdbeak.Repo]

# Configures the endpoint
config :birdbeak, BirdbeakWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2MqQ0N5isjVB0H5y2Th2nQurOtjcglgNbcnm6Tvyuhhnt17U4yzfGuXNqfHZLLla",
  render_errors: [view: BirdbeakWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Birdbeak.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :jwt_phoenix, :auth0,
  app_baseurl: System.get_env("AUTH0_BASEURL"),
  app_id: System.get_env("AUTH0_APP_ID"),
  app_secret: "AUTH0_APP_SECRET"
    |> System.get_env
    |> Kernel.||("")
    |> Base.url_decode64
    |> elem(1)

    
