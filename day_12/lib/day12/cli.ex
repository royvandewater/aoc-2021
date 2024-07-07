defmodule Day12.CLI do
  use Application

  def start(_type, _args) do
    input = File.read!("./input.txt") |> Day12.parse!()

    IO.puts("Day 12")
    part_1_result = Day12.part_1(input)
    IO.puts("Part 1: #{part_1_result}")
    part_2_result = Day12.part_2(input)
    IO.puts("Part 2: #{part_2_result}")

    {:ok, self()}
  end
end
