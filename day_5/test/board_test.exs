defmodule BoardTest do
  use ExUnit.Case

  describe "new" do
    test "should construct a new board" do
      assert Board.new() == %{}
    end
  end

  describe "from_lines" do
    test "when called with an empty list" do
      board = Board.from_lines([])
      assert board == %{}
    end

    test "when called with one line" do
      board = Board.from_lines([{{0, 0}, {2, 0}}])
      assert board == %{{0, 0} => 1, {1, 0} => 1, {2, 0} => 1}
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

    test "when called with a diagonal line segment" do
      board = Board.new() |> Board.add({{0, 0}, {2, 2}})

      assert board == %{{0, 0} => 1, {1, 1} => 1, {2, 2} => 1}
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
