defmodule Part2 do
  def part_2(input) do
    %{horizontal: h, depth: d} = next(input)
    h * d
  end

  def next(input) do
    next(input, %{horizontal: 0, depth: 0, aim: 0})
  end

  def next([], state) do
    state
  end

  def next([{:forward, x} | tail], state) do
    next(
      tail,
      state
      |> Map.update!(:horizontal, &(&1 + x))
      |> Map.update!(:depth, &(&1 + x * state[:aim]))
    )
  end

  def next([{:down, x} | tail], state) do
    next(tail, Map.update!(state, :aim, &(&1 + x)))
  end

  def next([{:up, x} | tail], state) do
    next(tail, Map.update!(state, :aim, &(&1 - x)))
  end
end
