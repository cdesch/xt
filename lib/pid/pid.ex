defmodule XT.Pid do
  @moduledoc """
  PID utilities

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
    pid_inspection = "#{inspect pid}" # gives the string "#PID<0.105.0>"
    pid_inspection
      |> String.slice(5, 100)
      |> String.trim(">")
  end

  @doc """
  Convert a pid to a list

  ## Examples

      iex> XT.Pid.pid_to_list(IEx.Helpers.pid(0, 1, 2))
      [0, 1, 2]

  """
  @spec pid_to_list(pid()) :: list()
  def pid_to_list(pid) do
    pid_to_string(pid)
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
