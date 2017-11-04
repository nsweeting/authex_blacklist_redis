defmodule Authex.Redis do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    import Supervisor.Spec

    children = [
      supervisor(Authex.Redis.Conn, [opts]),
      worker(Authex.Redis.Pool, [opts])
    ]

    supervise(children, strategy: :one_for_one)
  end

  def command(command) do
    conn = Authex.Redis.Pool.checkout()
    Redix.command(conn, command)
  end
end