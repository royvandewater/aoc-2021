defmodule Day11.CaveTest do
  alias Day11.Cave
  alias Day11.State
  use ExUnit.Case

  describe "simulate" do
    test "empty state" do
      assert Cave.simulate([]) == 0
    end
  end

  describe "simulate_until_sync" do
    test "empty state" do
      assert Cave.simulate_until_sync([]) == 0
    end

    test "one octopus" do
      assert Cave.simulate_until_sync([[1]]) == 9
    end
  end

  describe "step" do
    test "empty state" do
      state = State.from_input([])
      assert Cave.step(state) == %State{grid: %{}, step: 1, flashes: 0}
    end

    test "single octopus" do
      state = State.from_input([[0]])
      assert Cave.step(state).grid == State.input_to_grid([[1]])
    end

    test "single octopus flash" do
      state = State.from_input([[9]])
      next_state = Cave.step(state)

      assert next_state.grid == State.input_to_grid([[0]])
      assert next_state.flashes == 1
    end

    test "double octopus flash" do
      state = State.from_input([[9, 9]])
      assert Cave.step(state).grid == State.input_to_grid([[0, 0]])
      assert Cave.step(state).flashes == 2
    end

    test "cascading octopus flash" do
      state = State.from_input([[9, 8]])
      assert Cave.step(state).grid == State.input_to_grid([[0, 0]])
      assert Cave.step(state).flashes == 2
    end
  end
end
