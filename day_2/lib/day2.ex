defmodule Day2 do
  use Task

  def main() do
    input = parse(File.read!("./input.txt"))

    p1 = Part1.part_1(input)
    p2 = Part2.part_2(input)

    IO.puts("Part 1: #{p1}")
    IO.puts("Part 2: #{p2}")
  end

  def main_p() do
    parse(File.read!("./input.txt"))
    |> then(fn input ->
      [
        Task.async(Part1, :part_1, [input]),
        Task.async(Part2, :part_2, [input])
      ]
    end)
    |> Task.await_many()
    |> then(fn [p1, p2] ->
      IO.puts("Part 1: #{p1}")
      IO.puts("Part 2: #{p2}")
    end)
  end

  def parse(input_str) do
    input_str
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    [direction_str, amount_str] = String.split(line)

    direction = String.to_atom(direction_str)
    amount = String.to_integer(amount_str)

    {direction, amount}
  end

  def part_1(input) do
    Part1.part_1(input)
  end

  def part_2(input) do
    Part2.part_2(input)
  end
end

Day2.main()
Day2.main_p()
