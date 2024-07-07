defmodule Day7Test do
  use ExUnit.Case

  describe "parse!" do
    test "with an empty string" do
      assert Day7.parse!("") == []
    end

    test "with an sequence of numbers" do
      assert Day7.parse!("1,2,3") == [1, 2, 3]
    end
  end

  describe "part_1" do
    test "example 1" do
      input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
      assert Day7.part_1(input) == 37
    end

    test "a single number" do
      input = [16]
      assert Day7.part_1(input) == 0
    end

    test "two crabs that move toward each other" do
      input = [1, 3]
      assert Day7.part_1(input) == 2
    end

    test "three crabs where the middle one doesn't need to move" do
      input = [1, 2, 3]
      assert Day7.part_1(input) == 2
    end
  end

  describe "part_2" do
    test "example 1" do
      input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
      assert Day7.part_2(input) == 168
    end
  end

  describe "triangle_cost" do
    test "empty" do
      assert Day7.triangle_cost([], 1) == 0
    end

    test "one submarine moves one step" do
      assert Day7.triangle_cost([0], 1) == 1
    end

    test "one submarine moves two steps" do
      assert Day7.triangle_cost([0], 2) == 3
    end
  end
end
