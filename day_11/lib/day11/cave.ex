defmodule Day11.Cave do
  alias Day11.State, as: State

  def simulate(input) do
    input
    |> State.from_input()
    |> do_simulate()
  end

  defp do_simulate(state) when state.step == 100, do: state.flashes

  defp do_simulate(state) do
    state
    |> step()
    |> do_simulate()
  end

  def simulate_until_sync(input) do
    input
    |> State.from_input()
    |> do_simulate_until_sync()
  end

  defp do_simulate_until_sync(state) do
    if in_sync?(state) do
      state.step
    else
      state |> step() |> do_simulate_until_sync()
    end
  end

  defp in_sync?(state) do
    max_value =
      state.grid
      |> Map.values()
      |> Enum.max(&zero/0)

    max_value == 0
  end

  defp zero, do: 0

  def step(state) do
    state
    |> increase_energy_by_1()
    |> count_flashes()
    |> reset_flashed_octopi()
    |> increment_step()
  end

  defp increase_energy_by_1(state) do
    state.grid
    |> Map.keys()
    |> Enum.reduce(state, &increment_coordinate/2)
  end

  # TODO: I'm probably going to need to make grid a map instead of a list so that I can update arbitrary coordinates
  defp increment_coordinate({x, y}, state) do
    next_state = update_in(state.grid[{x, y}], &increment/1)

    if state.grid[{x, y}] == 9 do
      neighboring_coordinates({x, y}, state.xMax, state.yMax)
      |> Enum.reduce(next_state, &increment_coordinate/2)
    else
      next_state
    end
  end

  defp neighboring_coordinates({x0, y0}, xMax, yMax) do
    for x <- (x0 - 1)..(x0 + 1) do
      for y <- (y0 - 1)..(y0 + 1) do
        {x, y}
      end
    end
    |> List.flatten()
    |> Enum.reject(fn {x, y} -> x < 0 or x > xMax or y < 0 or y > yMax or {x, y} == {x0, y0} end)
  end

  defp increment(x), do: x + 1

  defp count_flashes(state) do
    step_flashes = state.grid |> Map.values() |> Enum.filter(&(&1 > 9)) |> length()

    %{state | flashes: state.flashes + step_flashes}
  end

  defp reset_flashed_octopi(state) do
    grid = state.grid |> Enum.map(&reset_flashed_octopus/1) |> Map.new()
    %{state | grid: grid}
  end

  # defp reset_flashed_octopi_row(row), do: Enum.map(row, &reset_flashed_octopus/1)
  defp reset_flashed_octopus({{x, y}, value}) when value > 9, do: {{x, y}, 0}
  defp reset_flashed_octopus(octopus), do: octopus

  defp increment_step(state) do
    %{state | step: state.step + 1}
  end
end
