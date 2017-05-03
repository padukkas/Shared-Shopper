# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :shared_shopper,
  ecto_repos: [SharedShopper.Repo]

# Configures the endpoint
config :shared_shopper, SharedShopper.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2fW9L99mqK4FgLBTpIPPkVEzdTT7Y4cepBs512GH48Q1ECFeYwU506HGW59XoPb5",
  render_errors: [view: SharedShopper.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SharedShopper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
