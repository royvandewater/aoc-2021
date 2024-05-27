defmodule Part1 do
  use Task

  def part_1(input) do
    [
      fn -> horizontal(input) end,
      fn -> vertical(input) end
    ]
    |> Enum.map(&Task.async/1)
    |> Task.await_many()
    |> then(fn [h, v] -> h * v end)
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
