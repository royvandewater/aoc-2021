defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  describe "new" do
    test "should construct a new board" do
      assert Board.new() == %{
               bounds: %{x: 0..0, y: 0..0},
               cells: %{}
             }
    end
  end

  describe "add" do
    test "when called with a line segment that starts and ends on the same point" do
      board = Board.new()

      assert Board.add(board, {{0, 0}, {0, 0}}) == %{
               bounds: %{x: 0..0, y: 0..0},
               cells: %{{0, 0} => 1}
             }
    end

    test "when called with a horizontal line segment" do
      board = Board.new()

      assert Board.add(board, {{0, 0}, {2, 0}}) == %{
               bounds: %{x: 0..2, y: 0..0},
               cells: %{{0, 0} => 1, {1, 0} => 1, {2, 0} => 1}
             }
    end

    test "when called with a vertical line segment" do
      board = Board.new()

      assert Board.add(board, {{0, 0}, {0, 2}}) == %{
               bounds: %{x: 0..0, y: 0..2},
               cells: %{{0, 0} => 1, {0, 1} => 1, {0, 2} => 1}
             }
    end

    test "when called with two line segments that overlap" do
      board = Board.new() |> Board.add({{0, 0}, {2, 0}}) |> Board.add({{0, 0}, {0, 2}})

      assert board == %{
               bounds: %{x: 0..2, y: 0..2},
               cells: %{{0, 0} => 2, {1, 0} => 1, {2, 0} => 1, {0, 1} => 1, {0, 2} => 1}
             }
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
