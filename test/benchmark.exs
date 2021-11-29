defmodule XT.Benchmark do
  def run() do

    pid_numbers = [
      {0, 1, 0},
      {0, 130, 0},
      {100, 1, 200},
      {101, 1221, 202},
    ]
    input = pid_numbers |> Enum.map(fn({x, y, z}) -> IEx.Helpers.pid(x, y, z) end)

    Benchee.run(
    %{
        "pid_to_string" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_string(x) end) end,
        "pid_to_string_erl" => fn -> input |> Enum.map(fn(x) -> XT.Pid.pid_to_string_erl(x) end) end,
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
