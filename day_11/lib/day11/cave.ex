defmodule Day11.Cave.State do
  defstruct grid: [], steps_left: 100, flashes: 0
end

defmodule Day11.Cave do
  alias Day11.Cave.State, as: State

  def simulate(input), do: do_simulate(%State{grid: input, steps_left: 100, flashes: 0})

  defp do_simulate(state) when state.steps_left == 0, do: state.flashes

  defp do_simulate(state) do
    state
    |> step()
    |> do_simulate()
  end

  def step(state) do
    state
    |> increase_energy_by_1()
    # |> cascade_flashes()
    # |> count_flashes()
    |> decrement_steps_left()
  end

  defp increase_energy_by_1(state) do
    new_grid =
      state.grid
      |> Enum.map(fn row -> Enum.map(row, &increment/1) end)

    %{state | grid: new_grid}
  end

  defp increment(x), do: x + 1

  def decrement_steps_left(state) do
    %{state | steps_left: state.steps_left - 1}
  end
end
