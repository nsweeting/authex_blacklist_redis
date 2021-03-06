defmodule Authex.Blacklist.Redis.Mixfile do
  use Mix.Project

  @version "0.1.2"

  def project do
    [
      app: :authex_blacklist_redis,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Authex.Blacklist.Redis.Application, []}
    ]
  end

  defp description do
    """
    A simple library for using redis as the token blacklist storage with Authex.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Nicholas Sweeting"],
      licenses: ["MIT"],
      links:  %{"GitHub" => "https://github.com/nsweeting/authex_blacklist_redis"}
    ]
  end

  defp docs do
    [
      source_url: "https://github.com/nsweeting/authex_blacklist_redis"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:authex, ">= 0.0.0"},
      {:redix, ">= 0.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
