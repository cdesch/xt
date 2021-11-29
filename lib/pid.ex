defmodule XT.Pid do
  @moduledoc """
  PID Utilities

  Convert `pid()` to `string`, `tuple`, or `list`.any()
  """

  @doc """
  Convert a `pid` to a `string`

  ## Examples

      iex> XT.Pid.pid_to_string(IEx.Helpers.pid(0, 1, 2))
      "0.1.2"

  """
  @spec pid_to_string(pid()) :: String.t()
  def pid_to_string(pid) do
    :erlang.pid_to_list(pid)
      |> to_string()
      |> String.slice(1..-2)
  end

  @doc """
  Legacy... Convert a `pid` to a `string`

  ## Examples

      iex> XT.Pid.pid_to_string(IEx.Helpers.pid(0, 1, 2))
      "0.1.2"

  """
  @spec pid_to_string_legacy(pid()) :: String.t()
  def pid_to_string_legacy(pid) do
    pid_inspection = "#{inspect pid}" # gives the string "#PID<0.105.0>"
    pid_inspection
      |> String.slice(5, 100)
      |> String.trim(">")
  end

  # :erlang.pid_to_list(IEx.Helpers.pid(0, 1, 2)) |> List.delete_at(0) |> List.delete_at(-1)
  @doc """
  Convert a pid to a list

  ## Examples

      iex> XT.Pid.pid_to_list(IEx.Helpers.pid(0, 1, 2))
      [0, 1, 2]

  """
  @spec pid_to_list(pid()) :: list()
  def pid_to_list(pid) do
    :erlang.pid_to_list(pid)
      |> List.delete_at(0)
      |> List.delete_at(-1)
      |> to_string()
      |> String.split(".")
      |> Enum.map(fn x -> String.to_integer(x) end)
  end


  @doc """
  Convert a `pid` to a tuple

  ## Examples

      iex> XT.Pid.pid_to_tuple(IEx.Helpers.pid(0, 1, 2))
      {0, 1, 2}

  """
  @spec pid_to_tuple(pid()) :: tuple()
  def pid_to_tuple(pid) do
    pid_to_string(pid)
      |> String.split(".")
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> List.to_tuple
  end
end
