defmodule XT.Seed do
  @moduledoc """
  Seed Utilities Functions
  """

  @doc """
  Convert the given fields to float values for the Map

  ## Examples

    iex> XT.Seed.convert_fields_to_int(%{balance: "10"}, [:balance])
    %{balance: 10}

    iex> XT.Seed.convert_fields_to_int(%{balance: "11", name: "john"}, [:balance])
    %{balance: 11, name: "john"}

  """
  @spec convert_fields_to_int(map(), list()) :: map()
  def convert_fields_to_int(row, keys) do
    Enum.reduce(keys, row, fn key, acc -> convert_to_int(acc, key) end)
  end

  @doc """
  Convert the given field to float value for the Map

  ## Examples

    iex> XT.Seed.convert_to_int(%{balance: "10"}, :balance)
    %{balance: 10}

    iex> XT.Seed.convert_to_int(%{balance: "11", name: "john"}, :balance)
    %{balance: 11, name: "john"}
  """
  @spec convert_to_int(map(), atom()) :: map()
  def convert_to_int(row, key) do
    Map.update!(row, key, fn x -> parse_string_to_int(x) end)
  end

  @doc """
  Parse the string into a float
  """
  @spec parse_string_to_int(String.t()) :: nil | integer
  def parse_string_to_int(value) do
    case Integer.parse(value) do
      {value, _exp} -> value
      :error -> nil
    end
  end


  @doc """
  Convert the given fields to float values for the Map

  ## Examples

    iex> XT.Seed.convert_fields_to_float(%{balance: "1.1"}, [:balance])
    %{balance: 1.1}

    iex> XT.Seed.convert_fields_to_float(%{balance: "3333.333", name: "john"}, [:balance])
    %{balance: 3333.333, name: "john"}

  """
  @spec convert_fields_to_float(map(), list()) :: map()
  def convert_fields_to_float(row, keys) do
    Enum.reduce(keys, row, fn key, acc -> convert_to_float(acc, key) end)
  end

  @doc """
  Convert the given field to float value for the Map

  ## Examples

    iex> XT.Seed.convert_to_float(%{balance: "3.33"}, :balance)
    %{balance: 3.33}

    iex> XT.Seed.convert_to_float(%{balance: "1.11", name: "john"}, :balance)
    %{balance: 1.11, name: "john"}
  """
  @spec convert_to_float(map(), atom()) :: map()
  def convert_to_float(row, key) do
    Map.update!(row, key, fn x -> parse_string_to_float(x) end)
  end

  @doc """
  Parse the string into a float
  """
  @spec parse_string_to_float(String.t()) :: nil | float
  def parse_string_to_float(value) do
    case Float.parse(value) do
      {value, _exp} -> value
      :error -> nil
    end
  end
end
