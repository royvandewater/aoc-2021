defmodule Day11.State do
  alias Day11.State, as: State
  defstruct grid: %{}, step: 0, flashes: 0, xMax: 0, yMax: 0

  def new(grid) do
    xMax = grid |> Map.keys() |> Enum.map(fn {x, _} -> x end) |> Enum.max(&zero/0)
    yMax = grid |> Map.keys() |> Enum.map(fn {_, y} -> y end) |> Enum.max(&zero/0)

    %State{grid: grid, xMax: xMax, yMax: yMax}
  end

  def input_to_grid(input) do
    input
    |> Enum.with_index()
    |> Enum.flat_map(&row_to_grid_entries/1)
    |> Map.new()
  end

  def from_input(input), do: input |> input_to_grid() |> new()

  defp row_to_grid_entries({row, y}) do
    row
    |> Enum.with_index()
    |> Enum.map(fn {value, x} -> {{x, y}, value} end)
  end

  defp zero, do: 0
end
