defmodule Day11.CaveTest do
  alias Day11.Cave
  alias Day11.Cave.State
  use ExUnit.Case

  describe "simulate" do
    test "empty state" do
      assert Cave.simulate([]) == 0
    end
  end

  describe "step" do
    test "empty state" do
      state = %State{grid: [], steps_left: 100, flashes: 0}
      assert Cave.step(state) == %State{grid: [], steps_left: 99, flashes: 0}
    end

    test "single octopus" do
      state = %State{grid: [[0]], steps_left: 100, flashes: 0}
      assert Cave.step(state).grid == [[1]]
    end
  end
end
