# Authex.Blacklist.Redis

[![Build Status](https://travis-ci.org/nsweeting/authex_blacklist_redis.svg?branch=master)](https://travis-ci.org/nsweeting/authex_blacklist_redis)
[![Authex.Blacklist.Redis Version](https://img.shields.io/hexpm/v/authex_blacklist_redis.svg)](https://hex.pm/packages/authex_blacklist_redis)

This is a simple library for using redis as the token blacklist storage with [Authex](https://github.com/nsweeting/authex)

## Installation

The package can be installed by adding `authex_blacklist_redis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:authex_blacklist_redis, "~> 0.1.2"}
  ]
end
```

## Documentation

See [HexDocs](https://hexdocs.pm/authex_blacklist_redis) for additional documentation.

## Configuration

In order to use this as your blacklist module, you must add the following to your Authex auth config.

```elixir
config :my_app, MyApp.Auth, [
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

Alternatively, you can place your redis url in the env var `REDIS_BLACKLIST_URL`.
