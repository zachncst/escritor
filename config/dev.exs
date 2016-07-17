use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :escritor, Escritor.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers:  [
    {"node", ["node_modules/webpack/bin/webpack.js", "--watch-stdin", "--progress", "--colors"]},
    {"node", ["node_modules/webpack/bin/webpack.js", "--watch-stdin", "--progress", "--colors", "--config", "webpack.server.config.js"]},
  ]

# Watch static and templates for browser reloading.
config :escritor, Escritor.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :escritor, Escritor.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "mysecretpassword",
  database: "escritor_dev",
  hostname: "localhost",
  pool_size: 10

config :escritor, Escritor.ReactIo,
  watch_files: [
    Path.join([__DIR__, "../priv/server/js/component.js"])
  ]
