# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bot,
  ecto_repos: [Bot.Repo]

# Configures the endpoint
config :bot, BotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ppBGX6GyumIgiHyTl/3W7W18IjRvQpq4MZeNKLTHMlU8klhLxecwOvsjuR7Luwnv",
  render_errors: [view: BotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
