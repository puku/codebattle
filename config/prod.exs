use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.

config :codebattle, CodebattleWeb.Endpoint,
  http: [port: 4000],
  url: [scheme: "http", host: "codebattle.hexlet.io", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config()[:version]

config :phoenix, :serve_endpoints, true

config :codebattle, Codebattle.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "codebattle",
  pool_size: 15

config :logger, backends: [{LoggerFileBackend, :info}, {LoggerFileBackend, :error}]

config :logger, :error,
  path: "/var/log/codebattle/error.log",
  level: :error

config :logger, :info,
  path: "/var/log/codebattle/info.log",
  level: :info

config :codebattle, Codebattle.Bot, timeout: 60_000

# Finally import the config/prod.secret.exs
# which should be versioned separately.
import_config "prod.secret.exs"

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :codebattle, Codebattle.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [port: 443,
#               keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#               certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables return an absolute path to
# the key and cert in disk or a relative path inside priv,
# for example "priv/ssl/server.key".
#
# We also recommend setting `force_ssl`, ensuring no data is
# ever sent via http, always redirecting to https:
#
#     config :codebattle, Codebattle.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :codebattle, Codebattle.Endpoint, server: true
#
