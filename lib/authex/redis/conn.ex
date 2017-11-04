defmodule Authex.Redis.Conn do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    import Supervisor.Spec

    pool_size  = Keyword.get(opts, :pool_size, 3)
    conn_url   = Keyword.get(opts, :url)
    conn_opts  = Keyword.take(opts, [:host, :port, :password, :database])
    redis_opts = conn_url || conn_opts
    conn_names = names(pool_size)

    children = Enum.map(conn_names, fn({index, name}) ->
      worker(Redix, [redis_opts, [name: name]], id: {Redix, index})
    end)

    supervise(children, strategy: :one_for_one)
  end

  def names(size) do
    Enum.map(1..size, fn(index) -> {index, :"Elixir.Authex.Redis.Conn.#{index}"} end)
  end
end
