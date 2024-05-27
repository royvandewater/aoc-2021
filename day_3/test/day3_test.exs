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

  describe "part_1" do
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

      assert Day3.part_1(input) == 198
    end
  end

  describe "gamma_rate" do
    test "empty" do
      assert Day3.gamma_rate([]) == 0
    end

    test "one item of single length" do
      assert Day3.gamma_rate([[1]]) == 1
    end

    test "two items, both 1" do
      assert Day3.gamma_rate([[1], [1]]) == 1
    end

    test "two 0's and a 1" do
      assert Day3.gamma_rate([[0], [0], [1]]) == 0
    end

    test "11, 10, and 01" do
      assert Day3.gamma_rate([[1, 1], [1, 0], [0, 1]]) == 3
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

      assert Day3.gamma_rate(input) == 22
    end
  end

  describe "epsilon_rate" do
    test "empty" do
      assert Day3.epsilon_rate([]) == 0
    end

    test "one item of single length" do
      assert Day3.epsilon_rate([[1]]) == 0
    end

    test "two items, both 1" do
      assert Day3.epsilon_rate([[1], [1]]) == 0
    end

    test "two 0's and a 1" do
      assert Day3.epsilon_rate([[0], [0], [1]]) == 1
    end

    test "11, 10, and 01" do
      assert Day3.epsilon_rate([[1, 1], [1, 0], [0, 1]]) == 0
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

      assert Day3.epsilon_rate(input) == 9
    end
  end

  describe "represent" do
    test "empty" do
      assert Day3.represent([]) == []
    end

    test "single item" do
      assert Day3.represent([[1, 0, 1]]) == [1, 0, 1]
    end

    test "single item different" do
      assert Day3.represent([[0, 0, 0]]) == [0, 0, 0]
    end

    test "two items" do
      assert Day3.represent([[1], [1]]) == [1]
    end

    test "three items, a 1 and two 0's do" do
      assert Day3.represent([[1], [0], [0]]) == [0]
    end

    test "11, 10, and 01" do
      assert Day3.represent([[1, 1], [1, 0], [0, 1]]) == [1, 1]
    end
  end

  describe "bin_to_int" do
    test "empty" do
      assert Day3.bin_to_int([]) == 0
    end

    test "one 1" do
      assert Day3.bin_to_int([1]) == 1
    end

    test "one 0" do
      assert Day3.bin_to_int([0]) == 0
    end

    test "two 1's" do
      assert Day3.bin_to_int([1, 1]) == 3
    end

    test "1, 0" do
      assert Day3.bin_to_int([1, 0]) == 2
    end

    test "1, 1, 1" do
      assert Day3.bin_to_int([1, 1, 1]) == 7
    end
  end
end
