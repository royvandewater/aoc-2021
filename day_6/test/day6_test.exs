defmodule Day6Test do
  use ExUnit.Case

  describe "part_1" do
    test "example 1" do
      input = [3, 4, 3, 1, 2]
      assert Day6.part_1(input) == 5934
    end
  end

  describe "day" do
    test "with an empty list" do
      assert Day6.day([]) == []
    end

    test "with a single fish at 3" do
      assert Day6.day([3]) == [2]
    end

    test "with a fish at 0, about to reproduce, and another at 3" do
      assert Day6.day([0, 3]) == [6, 2, 8]
    end
  end

  describe "parse!" do
    test "with an empty input" do
      assert Day6.parse!("") == []
    end

    test "with a sequence of numbers" do
      assert Day6.parse!("1,2,3") == [1, 2, 3]
    end
  end
end
