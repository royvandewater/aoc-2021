defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  describe "parse" do
    test "empty" do
      assert Day3.parse("") == []
    end

    test "one item" do
      assert Day3.parse("111") == [[1, 1, 1]]
    end
  end
end
