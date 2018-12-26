defmodule BitbucketTest do
  use ExUnit.Case
  doctest Bitbucket

  test "greets the world" do
    assert Bitbucket.hello() == :world
  end
end
