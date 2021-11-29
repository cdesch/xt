
defmodule XT.SeedTest do
  use ExUnit.Case
  doctest XT.Seed

  test "convert_fields_to_int/2" do
    input = %{balance: "10", name: "john"}
    assert XT.Seed.convert_fields_to_int(input, [:balance]) == %{balance: 10, name: "john"}
  end


  test "convert_to_int/2" do
    input = %{balance: "10", name: "john"}
    assert XT.Seed.convert_to_int(input, :balance) == %{balance: 10, name: "john"}
  end

  test "convert_fields_to_float/2" do
    input = %{balance: "1.1", name: "john"}
    assert XT.Seed.convert_fields_to_float(input, [:balance]) == %{balance: 1.1, name: "john"}
  end

  test "convert_to_float/2" do
    input = %{balance: "1.10", name: "john"}
    assert XT.Seed.convert_to_float(input, :balance) == %{balance: 1.1, name: "john"}
  end

end
