defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  describe "part_1" do
    test "example 1" do
      input = [
        [[0, 9], [5, 9]],
        [[8, 0], [0, 8]],
        [[9, 4], [3, 4]],
        [[2, 2], [2, 1]],
        [[7, 0], [7, 4]],
        [[6, 4], [2, 0]],
        [[0, 9], [2, 9]],
        [[3, 4], [1, 4]],
        [[0, 0], [8, 8]],
        [[5, 5], [8, 2]]
      ]

      assert Day5.part_1(input) == 5
    end

    test "when there are 0 lines" do
      input = []
      assert Day5.part_1(input) == 0
    end

    test "when there are two lines with full overlap" do
      input = [
        [[0, 0], [0, 1]],
        [[0, 0], [0, 1]]
      ]

      assert Day5.part_1(input) == 2
    end

    test "when there are two lines with no overlap" do
      input = [
        [[0, 0], [0, 1]],
        [[1, 0], [1, 1]]
      ]

      assert Day5.part_1(input) == 0
    end
  end
end
