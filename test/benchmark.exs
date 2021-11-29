defmodule XT.Benchmark do
  def run() do

    pid_numbers = [
      {0, 1, 0},
      {0, 130, 0},
      {0, 1222, 0},
      {0, 122, 202},
    ]
    input = pid_numbers |> Enum.map(fn({x, y, z}) -> IEx.Helpers.pid(x, y, z) end)

    Benchee.run(
    %{
        "pid_to_string" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_string(x) end) end,
        "pid_to_string_legacy" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_string_legacy(x) end) end,
        "pid_to_tuple" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_tuple(x) end) end,
        "pid_to_list" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_list(x) end) end,
      },
      formatters: [
        {Benchee.Formatters.HTML, file: "samples_output/my.html"},
        {Benchee.Formatters.Console, extended_statistics: true}
      ]
    )
    # XT.Pid.pid_to_string()
  end
end
XT.Benchmark.run()
