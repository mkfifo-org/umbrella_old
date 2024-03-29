# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :fifo,
  namespace: FIFO,
  ecto_repos: [FIFO.Repo]

config :mkfifo,
  namespace: MkFIFO,
  ecto_repos: [FIFO.Repo],
  generators: [context_app: :fifo, binary_id: true]

# Configures the endpoint
config :mkfifo, MkFIFO.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xdPM9/IOG7s7kpG07/dB3oE3ULwBnT1fijlmuP/Fb324oE1jDU/eX+E7OpcsV2v3",
  render_errors: [view: MkFIFO.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MkFIFO.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
