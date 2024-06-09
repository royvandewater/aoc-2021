defmodule Day7 do
  use Application

  def start(_type, _args) do
    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")

    {:ok, self()}
  end

  def parse!(str) do
    str
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(positions) do
    gradient_descent(positions)
  end

  defp gradient_descent(positions) do
    min = Enum.min(positions)
    max = Enum.max(positions)
    curr = min + div(max - min, 2)
    gradient_descent(positions, min, max, curr)
  end

  defp gradient_descent(positions, min, max, curr) do
    cost0 = cost(positions, curr - 1)
    cost1 = cost(positions, curr)
    cost2 = cost(positions, curr + 1)

    case Enum.min([cost0, cost1, cost2]) do
      ^cost0 -> gradient_descent(positions, min, max, curr - 1)
      ^cost1 -> cost1
      ^cost2 -> gradient_descent(positions, min, max, curr + 1)
    end
  end

  def cost(positions, target) do
    positions
    |> Enum.map(&abs(target - &1))
    |> Enum.sum()
  end
end
