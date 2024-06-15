defmodule Day9.CLI do
  use Application

  def start(_type, _args) do
    part_1_result =
      File.read!("./input.txt")
      |> Day9.parse!()
      |> Day9.part_1()

    IO.puts("Day 9")
    IO.puts("Part 1: #{part_1_result}")

    {:ok, self()}
  end
end
