defmodule Day6Test do
  use ExUnit.Case

  describe "part_1" do
    test "example 1" do
      input = [3, 4, 3, 1, 2]
      assert Day6.part_1(input) == 5934
    end
  end

  describe "part_2" do
    test "example 1" do
      input = [3, 4, 3, 1, 2]
      assert Day6.part_2(input) == 26_984_457_539
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
