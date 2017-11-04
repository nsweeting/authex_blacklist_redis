defmodule Authex.Redis.Pool do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    pool_size = Keyword.get(opts, :pool_size, 3)
    {:ok, names(pool_size)}
  end

  def handle_call(:checkout, _from, [head | tail]) do
    {:reply, head, tail ++ [head]}
  end

  def checkout do
    GenServer.call(__MODULE__, :checkout)
  end

  def names(size) do
    conns = Authex.Redis.Conn.names(size)
    Enum.map(conns, fn({_, conn_name}) -> conn_name end)
  end
end
