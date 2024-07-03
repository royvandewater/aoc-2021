defmodule Day11.CLI do
  use Application

  def start(_type, _args) do
    input = File.read!("./input.txt") |> Day11.parse!()

    IO.puts("Day 10")
    part_1_result = Day11.part_1(input)
    IO.puts("Part 1: #{part_1_result}")
    part_2_result = Day11.part_2(input)
    IO.puts("Part 2: #{part_2_result}")

    {:ok, self()}
  end
end
