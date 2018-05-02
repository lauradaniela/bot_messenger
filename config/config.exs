# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :messenger,
  ecto_repos: [Messenger.Repo]

# Configures the endpoint
config :messenger, MessengerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3PCZDVNS2IYbwt935sdOLN0IrFrOxLOKxVRUb3mXPZ/j3u41EqJnq63/kWDUYlJH",
  render_errors: [view: MessengerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Messenger.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configure facebook_messenger
config :facebook_messenger,
  facebook_page_token: "EAAPJ6djjwkMBAE0hnMYCiGqC5QKN9LXvsrZCSOj6thqoisdAWfY66PlbldBRwE5lt4jAM3ASScrxjIwc4Oo0PTvRbTWZAcNzJLAZAQYVyCyydjB1vDjWRTBeepWoZA5ZBa5uZAMR4uSfSx31ZBxejsOxTVLAegxCZBG9dhAj1JrXEgZDZD",
  challenge_verify_token: "advocates_response"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
