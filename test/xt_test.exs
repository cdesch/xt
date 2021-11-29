defmodule XTTest do
  use ExUnit.Case
  doctest XT

  test "greets the world" do
    assert XT.hello() == :world
  end
end
