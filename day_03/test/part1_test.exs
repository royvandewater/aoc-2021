defmodule Part1Test do
  use ExUnit.Case
  doctest Part1

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

      assert Part1.part_1(input) == 198
    end
  end

  describe "gamma_rate" do
    test "empty" do
      assert Part1.gamma_rate([]) == 0
    end

    test "one item of single length" do
      assert Part1.gamma_rate([[1]]) == 1
    end

    test "two items, both 1" do
      assert Part1.gamma_rate([[1], [1]]) == 1
    end

    test "two 0's and a 1" do
      assert Part1.gamma_rate([[0], [0], [1]]) == 0
    end

    test "11, 10, and 01" do
      assert Part1.gamma_rate([[1, 1], [1, 0], [0, 1]]) == 3
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

      assert Part1.gamma_rate(input) == 22
    end
  end

  describe "epsilon_rate" do
    test "empty" do
      assert Part1.epsilon_rate([]) == 0
    end

    test "one item of single length" do
      assert Part1.epsilon_rate([[1]]) == 0
    end

    test "two items, both 1" do
      assert Part1.epsilon_rate([[1], [1]]) == 0
    end

    test "two 0's and a 1" do
      assert Part1.epsilon_rate([[0], [0], [1]]) == 1
    end

    test "11, 10, and 01" do
      assert Part1.epsilon_rate([[1, 1], [1, 0], [0, 1]]) == 0
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

      assert Part1.epsilon_rate(input) == 9
    end
  end

  describe "represent" do
    test "empty" do
      assert Part1.represent([]) == []
    end

    test "single item" do
      assert Part1.represent([[1, 0, 1]]) == [1, 0, 1]
    end

    test "single item different" do
      assert Part1.represent([[0, 0, 0]]) == [0, 0, 0]
    end

    test "two items" do
      assert Part1.represent([[1], [1]]) == [1]
    end

    test "three items, a 1 and two 0's do" do
      assert Part1.represent([[1], [0], [0]]) == [0]
    end

    test "11, 10, and 01" do
      assert Part1.represent([[1, 1], [1, 0], [0, 1]]) == [1, 1]
    end
  end
end
