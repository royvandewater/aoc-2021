defmodule UtilTest do
  use ExUnit.Case
  doctest Util

  describe "bin_to_int" do
    test "empty" do
      assert Util.bin_to_int([]) == 0
    end

    test "one 1" do
      assert Util.bin_to_int([1]) == 1
    end

    test "one 0" do
      assert Util.bin_to_int([0]) == 0
    end

    test "two 1's" do
      assert Util.bin_to_int([1, 1]) == 3
    end

    test "1, 0" do
      assert Util.bin_to_int([1, 0]) == 2
    end

    test "1, 1, 1" do
      assert Util.bin_to_int([1, 1, 1]) == 7
    end
  end
end
