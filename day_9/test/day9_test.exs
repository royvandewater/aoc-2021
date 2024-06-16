defmodule Day9Test do
  alias Day9.Heightmap
  use ExUnit.Case

  describe "parse!" do
    test "an empty input" do
      input = ""

      assert Day9.parse!(input) == %{}
    end

    test "a single number" do
      input = "1"

      assert Day9.parse!(input) == %{{0, 0} => 1}
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

  describe "part_2" do
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

      assert Day9.part_2(input) == 1134
    end
  end

  describe "low_points" do
    test "an empty list" do
      hm = Heightmap.new([])
      assert Day9.low_points(hm) == []
    end

    test "a single point" do
      hm = Heightmap.new([[1]])
      assert Day9.low_points(hm) == [1]
    end

    test "two points next to each other" do
      hm = Heightmap.new([[1, 2]])
      assert Day9.low_points(hm) == [1]
    end

    test "two points above each other" do
      hm = Heightmap.new([[1], [2]])
      assert Day9.low_points(hm) == [1]
    end
  end
end
