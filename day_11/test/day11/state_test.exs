defmodule Day11.StateTest do
  alias Day11.State
  use ExUnit.Case

  describe "input_to_grid" do
    test "empty input" do
      assert State.input_to_grid([]) == %{}
    end

    test "one octopus" do
      assert State.input_to_grid([[1]]) == %{{0, 0} => 1}
    end

    test "two octopi in a row" do
      assert State.input_to_grid([[1, 2]]) == %{{0, 0} => 1, {1, 0} => 2}
    end

    test "two octopi in a column" do
      assert State.input_to_grid([[1], [2]]) == %{{0, 0} => 1, {0, 1} => 2}
    end
  end
end
