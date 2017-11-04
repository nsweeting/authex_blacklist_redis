defmodule Authex.Blacklist.Redis.Mixfile do
  use Mix.Project

  def project do
    [
      app: :authex_blacklist_redis,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Authex.Blacklist.Redis.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:authex, ">= 0.0.0"},
      {:redix, ">= 0.0.0"}
    ]
  end
end
