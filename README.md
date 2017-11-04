# Authex.Blacklist.Redis

This is a simple library for using redis as the token blacklist storage with [Authex](https://github.com/nsweeting/authex)

## Installation

The package can be installed by adding `authex_blacklist_redis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:authex_blacklist_redis, "~> 0.1.0"}
  ]
end
```

## Documentation

See [HexDocs](https://hexdocs.pm/authex_blacklist_redis) for additional documentation.

## Configuration

In order to use this as your blacklist module, you must add the following your Authex config.

```elixir
config :authex, [
  blacklist: Authex.Blacklist.Redis,
]
```

We can configure our redis connection with the following options.

```elixir
config :authex, Authex.Blacklist.Redis, [
  # The number of redis connections to use. Default is 3.
  pool_size: 3,
  # The url of your redis server.
  url: "url..."
]
```

Alternatively, you can place your redis url in the env var `REDIS_URL`.
