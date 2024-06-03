defmodule BoardTest do
  use ExUnit.Case

  describe "mark" do
    test "mark 1" do
      input = [
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]]
      ]

      assert Board.mark(input, 1) == [
               [[1, true], [2, false], [3, false], [4, false], [5, false]],
               [[1, true], [2, false], [3, false], [4, false], [5, false]],
               [[1, true], [2, false], [3, false], [4, false], [5, false]],
               [[1, true], [2, false], [3, false], [4, false], [5, false]],
               [[1, true], [2, false], [3, false], [4, false], [5, false]]
             ]
    end
  end

  describe "parse!" do
    test "standard input" do
      result = Board.parse!("
       1   2  3  4  5
       6   7  8  9 10
       11 12 13 14 15
       16 17 18 19 20
       21 22 23 24 25
      ")

      assert result == [
               [[1, false], [2, false], [3, false], [4, false], [5, false]],
               [[6, false], [7, false], [8, false], [9, false], [10, false]],
               [[11, false], [12, false], [13, false], [14, false], [15, false]],
               [[16, false], [17, false], [18, false], [19, false], [20, false]],
               [[21, false], [22, false], [23, false], [24, false], [25, false]]
             ]
    end
  end

  describe "score" do
    test "when nothing is marked" do
      input = [
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]]
      ]

      # each row is 15, 15 * 5 = 75
      assert Board.score(input) == 75
    end

    test "when one cell in each column & row is marked" do
      input = [
        [[1, true], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, true], [4, false], [5, false]],
        [[1, false], [2, true], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, true]],
        [[1, false], [2, false], [3, false], [4, true], [5, false]]
      ]

      # 1 + 2 + 3 + 4 + 5 = 15, 75 - 15 = 60
      assert Board.score(input) == 60
    end
  end

  describe "wins?" do
    test "when nothing is marked" do
      input = [
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]]
      ]

      assert Board.wins?(input) == false
    end

    test "when the first row is marked" do
      input = [
        [[1, true], [2, true], [3, true], [4, true], [5, true]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]],
        [[1, false], [2, false], [3, false], [4, false], [5, false]]
      ]

      assert Board.wins?(input) == true
    end

    test "when the first column is marked" do
      input = [
        [[1, true], [2, false], [3, false], [4, false], [5, false]],
        [[1, true], [2, false], [3, false], [4, false], [5, false]],
        [[1, true], [2, false], [3, false], [4, false], [5, false]],
        [[1, true], [2, false], [3, false], [4, false], [5, false]],
        [[1, true], [2, false], [3, false], [4, false], [5, false]]
      ]

      assert Board.wins?(input) == true
    end
  end
end
