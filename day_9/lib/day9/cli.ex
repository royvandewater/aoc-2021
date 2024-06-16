defmodule Day9.CLI do
  use Application

  def start(_type, _args) do
    heightmap = File.read!("./input.txt") |> Day9.parse!()

    IO.puts("Day 9")
    part_1_result = Day9.part_1(heightmap)
    IO.puts("Part 1: #{part_1_result}")
    part_2_result = Day9.part_2(heightmap)
    IO.puts("Part 2: #{part_2_result}")

    {:ok, self()}
  end
end
