defmodule Authex.Blacklist.RedisTest do
  use ExUnit.Case

  test "that the blacklist works" do
    Application.put_env(:authex, :blacklist, Authex.Blacklist.Redis)

    assert Authex.Blacklist.get("foo") == false
    assert Authex.Blacklist.set("foo") == :ok
    assert Authex.Blacklist.get("foo") == true
    assert Authex.Blacklist.del("foo") == :ok
    assert Authex.Blacklist.get("foo") == false
  end
end
