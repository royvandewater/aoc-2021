defmodule Part2Test do
  use ExUnit.Case
  doctest Part2

  describe "part_2" do
    test "example 1" do
      input = [
        [0, 0, 1, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 1, 1, 0],
        [1, 0, 1, 1, 1],
        [1, 0, 1, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 1, 1, 1],
        [1, 1, 1, 0, 0],
        [1, 0, 0, 0, 0],
        [1, 1, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 1, 0, 1, 0]
      ]

      assert Part2.part_2(input) == 230
    end
  end

  describe "oxygen" do
    test "one item" do
      assert Part2.oxygen([[1, 1, 1]]) == 7
    end

    test "three items" do
      assert Part2.oxygen([[1, 1], [1, 0], [0, 1]]) == 3
    end

    test "example 1" do
      input = [
        [0, 0, 1, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 1, 1, 0],
        [1, 0, 1, 1, 1],
        [1, 0, 1, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 1, 1, 1],
        [1, 1, 1, 0, 0],
        [1, 0, 0, 0, 0],
        [1, 1, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 1, 0, 1, 0]
      ]

      assert Part2.oxygen(input) == 23
    end
  end

  describe "co2" do
    test "one item" do
      assert Part2.co2([[1, 1, 1]]) == 7
    end

    test "three items" do
      assert Part2.co2([[1, 1], [1, 0], [0, 1]]) == 1
    end

    test "example 1" do
      input = [
        [0, 0, 1, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 1, 1, 0],
        [1, 0, 1, 1, 1],
        [1, 0, 1, 0, 1],
        [0, 1, 1, 1, 1],
        [0, 0, 1, 1, 1],
        [1, 1, 1, 0, 0],
        [1, 0, 0, 0, 0],
        [1, 1, 0, 0, 1],
        [0, 0, 0, 1, 0],
        [0, 1, 0, 1, 0]
      ]

      assert Part2.co2(input) == 10
    end
  end
end
