defmodule Day3 do
  def main() do
    result =
      File.read!("./input.txt")
      |> parse()
      |> part_1()

    IO.puts("Part 1: #{result}")
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    line
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(items) do
    gamma_rate(items) * epsilon_rate(items)
  end

  def gamma_rate([]) do
    0
  end

  def gamma_rate(items) do
    items
    |> represent()
    |> bin_to_int()
  end

  def epsilon_rate(items) do
    items
    |> represent()
    |> invert()
    |> bin_to_int()
  end

  def represent(list) do
    list
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sum/1)
    |> Enum.map(fn n ->
      if n > Enum.count(list) / 2 do
        1
      else
        0
      end
    end)
  end

  def invert([]) do
    []
  end

  def invert([head | tail]) do
    value =
      case head do
        1 -> 0
        0 -> 1
      end

    [value | invert(tail)]
  end

  def bin_to_int([]) do
    0
  end

  def bin_to_int([head | tail]) do
    n = Enum.count(tail)

    value = head * 2 ** n
    value + bin_to_int(tail)
  end
end

Day3.main()
