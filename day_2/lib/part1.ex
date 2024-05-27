defmodule Part1 do
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
