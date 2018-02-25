defmodule Authex.Blacklist.RedisTest do
  use ExUnit.Case

  defmodule Auth do
    use Authex, otp_app: :authex_blacklist_redis
  end

  test "that the blacklist works" do
    assert Authex.Blacklist.get(Authex.Blacklist.Redis, "foo") == false
    assert Authex.Blacklist.set(Authex.Blacklist.Redis, "foo") == :ok
    assert Authex.Blacklist.get(Authex.Blacklist.Redis, "foo") == true
    assert Authex.Blacklist.del(Authex.Blacklist.Redis, "foo") == :ok
    assert Authex.Blacklist.get(Authex.Blacklist.Redis, "foo") == false
  end

  test "that the blacklist works through an Auth module" do
    Application.put_env(:authex_blacklist_redis, Auth, [blacklist: Authex.Blacklist.Redis])

    assert Auth.blacklisted?("foo") == false
    assert Auth.blacklist("foo") == :ok
    assert Auth.blacklisted?("foo") == true
    assert Auth.unblacklist("foo") == :ok
    assert Auth.blacklisted?("foo") == false
  end
end
