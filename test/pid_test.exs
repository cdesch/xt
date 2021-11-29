defmodule XT.PidTest do
  use ExUnit.Case
  doctest XT.Pid

  test "pid_to_string/1" do
    sample_pid = IEx.Helpers.pid(0, 3, 0)
    assert XT.Pid.pid_to_string(sample_pid) == "0.3.0"

    sample_pid = IEx.Helpers.pid(0, 300, 0)
    assert XT.Pid.pid_to_string(sample_pid) == "0.300.0"
  end

  test "pid_to_string_erl/1" do
    sample_pid = IEx.Helpers.pid(0, 3, 0)
    assert XT.Pid.pid_to_string_erl(sample_pid) == "0.3.0"
  end

  test "pid_to_tuple/1" do
    sample_pid = IEx.Helpers.pid(0, 3, 0)
    assert XT.Pid.pid_to_tuple(sample_pid) == {0, 3 ,0}
  end

  test "pid_to_list/1" do
    sample_pid = IEx.Helpers.pid(0, 3, 0)
    assert XT.Pid.pid_to_list(sample_pid) == [0, 3 ,0]
  end
end
