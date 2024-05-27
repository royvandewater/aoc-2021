defmodule Day2 do
  def main() do
    input = parse(File.read!("./input.txt"))

    IO.puts("Part 1: #{part_1(input)}")
    IO.puts("Part 2: #{part_2(input)}")
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
