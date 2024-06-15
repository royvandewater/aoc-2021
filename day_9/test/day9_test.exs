defmodule Day9Test do
  use ExUnit.Case
  doctest Day9

  describe "parse!" do
    test "an empty input" do
      input = ""

      assert Day9.parse!(input) == []
    end

    test "a single number" do
      input = "1"

      assert Day9.parse!(input) == [[1]]
    end
  end

  describe "part_1" do
    test "example 1" do
      input =
        """
          2199943210
          3987894921
          9856789892
          8767896789
          9899965678
        """
        |> Day9.parse!()

      assert Day9.part_1(input) == 15
    end
  end

  describe "low_points" do
    test "an empty list" do
      assert Day9.low_points([]) == []
    end

    test "a single point" do
      assert Day9.low_points([[1]]) == [1]
    end

    test "two points next to each other" do
      assert Day9.low_points([[1, 2]]) == [1]
    end

    test "two points above each other" do
      assert Day9.low_points([[1], [2]]) == [1]
    end
  end
end
