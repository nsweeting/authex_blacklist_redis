defmodule Authex.Blacklist.Redis do
  use Authex.Blacklist

  def handle_get(jti) do
    case Authex.Redis.command(["SISMEMBER", "token:blacklist", jti]) do
      {:ok, 0} -> false
      {:ok, 1} -> true
      {:error, _} -> :error
    end
  end

  def handle_set(jti) do
    case Authex.Redis.command(["SADD", "token:blacklist", jti]) do
      {:ok, _} -> :ok
      {:error, _} -> :error
    end
  end

  def handle_del(jti) do
    case Authex.Redis.command(["SREM", "token:blacklist", jti]) do
      {:ok, _} -> :ok
      {:error, _} -> :error
    end
  end
end
