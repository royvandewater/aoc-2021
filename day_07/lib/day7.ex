defmodule Day7 do
  use Application

  def start(_type, _args) do
    input = File.read!("./input.txt") |> parse!()
    IO.puts("part 1: #{part_1(input)}")
    IO.puts("part 2: #{part_2(input)}")

    {:ok, self()}
  end

  def parse!(str) do
    str
    |> String.trim()
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part_1(positions) do
    gradient_descent(&flat_cost/2, positions)
  end

  def part_2(positions) do
    gradient_descent(&triangle_cost/2, positions)
  end

  defp gradient_descent(cost_fn, positions) do
    min = Enum.min(positions)
    max = Enum.max(positions)
    curr = min + div(max - min, 2)
    gradient_descent(cost_fn, positions, min, max, curr)
  end

  defp gradient_descent(cost_fn, positions, min, max, curr) do
    cost0 = cost_fn.(positions, curr - 1)
    cost1 = cost_fn.(positions, curr)
    cost2 = cost_fn.(positions, curr + 1)

    case Enum.min([cost0, cost1, cost2]) do
      ^cost0 -> gradient_descent(cost_fn, positions, min, max, curr - 1)
      ^cost1 -> cost1
      ^cost2 -> gradient_descent(cost_fn, positions, min, max, curr + 1)
    end
  end

  def flat_cost(positions, target) do
    positions
    |> Enum.map(&abs(target - &1))
    |> Enum.sum()
  end

  def triangle_cost(positions, target) do
    positions
    |> Enum.map(&abs(target - &1))
    |> Enum.map(&triangle_number/1)
    |> Enum.sum()
  end

  def triangle_number(0) do
    0
  end

  def triangle_number(n) when n > 0 do
    n + triangle_number(n - 1)
  end
end
