defmodule Day00Test do
  use ExUnit.Case

  describe "parse!" do
    test "empty input" do
      assert Day00.parse!("") == []
    end
  end

  describe "part_1" do
    test "empty input" do
      assert Day00.part_1([]) == 0
    end
  end

  describe "part_2" do
    test "example 1" do
      assert Day00.part_2([]) == 0
    end
  end
end
