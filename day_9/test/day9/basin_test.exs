defmodule Day9Test.Basin do
  use ExUnit.Case
  alias Day9.Basin, as: Basin
  alias Day9.Heightmap, as: Heightmap

  describe "discover" do
    test "a single point map" do
      hm = Heightmap.new([[1]])
      assert Basin.discover({0, 0}, hm) == MapSet.new([{0, 0}])
    end

    test "a two point map" do
      hm = Heightmap.new([[1, 2]])
      assert Basin.discover({0, 0}, hm) == MapSet.new([{0, 0}, {1, 0}])
    end

    test "a two point map, but the second coordinate is a 9" do
      hm = Heightmap.new([[1, 9]])
      assert Basin.discover({0, 0}, hm) == MapSet.new([{0, 0}])
    end

    test "a three point map, with a 9 dividing the basins" do
      hm = Heightmap.new([[1, 9, 2]])
      assert Basin.discover({0, 0}, hm) == MapSet.new([{0, 0}])
    end

    test "a two point map, arranged vertically" do
      hm = Heightmap.new([[1], [2]])
      assert Basin.discover({0, 0}, hm) == MapSet.new([{0, 0}, {0, 1}])
    end
  end
end
