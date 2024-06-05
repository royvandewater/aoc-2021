defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  describe "new" do
    test "should construct a new board" do
      assert Board.new() == %{}
    end
  end

  describe "add" do
    test "when called with a line segment that starts and ends on the same point" do
      board = Board.new() |> Board.add({{0, 0}, {0, 0}})

      assert board == %{{0, 0} => 1}
    end

    test "when called with a horizontal line segment" do
      board = Board.new() |> Board.add({{0, 0}, {2, 0}})

      assert board == %{{0, 0} => 1, {1, 0} => 1, {2, 0} => 1}
    end

    test "when called with a vertical line segment" do
      board = Board.new() |> Board.add({{0, 0}, {0, 2}})

      assert board == %{{0, 0} => 1, {0, 1} => 1, {0, 2} => 1}
    end

    test "when called with two line segments that overlap" do
      board = Board.new() |> Board.add({{0, 0}, {2, 0}}) |> Board.add({{0, 0}, {0, 2}})

      assert board == %{{0, 0} => 2, {1, 0} => 1, {2, 0} => 1, {0, 1} => 1, {0, 2} => 1}
    end
  end

  describe "score" do
    test "when called with an empty board" do
      board = Board.new()
      assert Board.score(board) == 0
    end

    test "when called with two line segments that overlap at a single point" do
      board = Board.new() |> Board.add({{0, 0}, {2, 0}}) |> Board.add({{0, 0}, {0, 2}})

      assert Board.score(board) == 1
    end
  end
end
