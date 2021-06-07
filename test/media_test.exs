defmodule MediaTest do
  use ExUnit.Case
  doctest Media

  test "greets the world" do
    assert Media.hello() == :world
  end
end
