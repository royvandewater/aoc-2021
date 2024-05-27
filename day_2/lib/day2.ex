defmodule Day2 do
  def main() do
    input = parse(File.read!("./input.txt"))

    IO.puts("Part 1: #{part_1(input)}")
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
    horizontal(input) * vertical(input)
  end

  def horizontal([]) do
    0
  end

  def horizontal([{:forward, x} | tail]) do
    x + horizontal(tail)
  end

  def horizontal([_ | tail]) do
    horizontal(tail)
  end

  def vertical([]) do
    0
  end

  def vertical([{:down, x} | tail]) do
    x + vertical(tail)
  end

  def vertical([{:up, x} | tail]) do
    -x + vertical(tail)
  end

  def vertical([_ | tail]) do
    vertical(tail)
  end
end

Day2.main()
