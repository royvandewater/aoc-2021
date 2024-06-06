defmodule Day6 do
  use Application

  def start(_type, _arts) do
    IO.puts("Day 6")

    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")
    IO.puts("part 2: #{part_2(input)}")

    {:ok, self()}
  end

  def parse!(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(input) do
    input
    |> School.new()
    |> days(80)
    |> School.count()
  end

  def part_2(input) do
    input
    |> School.new()
    |> days(256)
    |> School.count()
  end

  defp days(school, 0), do: school

  defp days(school, n) do
    school
    |> School.day()
    |> days(n - 1)
  end
end
