defmodule Authex.Blacklist.Redis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, options) do
    import Supervisor.Spec, warn: false

    options = build_options(options)

    # List all child processes to be supervised
    children = [
      worker(Authex.Redis, [options])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Authex.Blacklist.Redis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp build_options(options) do
    :authex
    |> Application.get_env(Authex.Blacklist.Redis, [])
    |> Keyword.merge(options)
    |> Keyword.put_new(:url, System.get_env("REDIS_BLACKLIST_URL"))
  end
end
