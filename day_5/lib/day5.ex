defmodule Day5 do
  use Application

  def start(_type, _args) do
    IO.puts("Day 5")

    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")

    {:ok, self()}
  end

  def parse!(_string) do
    []
  end

  def part_1(input), do: Enum.count(input)
end
