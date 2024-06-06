defmodule SchoolTest do
  use ExUnit.Case

  describe "new" do
    test "with an empty list" do
      assert School.new([]) == []
    end

    test "with a 1, 2, 3, 4" do
      actual = List.keysort(School.new([1, 2, 3, 4]), 0)

      assert actual == List.keysort([{1, 1}, {2, 1}, {3, 1}, {4, 1}], 0)
    end

    test "with a 1, 1, 1, 1" do
      assert School.new([1, 1, 1, 1]) == [{1, 4}]
    end
  end

  describe "day" do
    test "with an empty list" do
      input = School.new([])
      assert School.day(input) == []
    end

    test "with a single fish at 3" do
      input = School.new([3])
      assert School.day(input) == [{2, 1}]
    end

    test "with a fish at 0, about to reproduce, and another at 3" do
      actual = School.new([0, 3]) |> School.day() |> List.keysort(0)
      expected = [{6, 1}, {2, 1}, {8, 1}] |> List.keysort(0)
      assert actual == expected
    end

    test "with a fish at 0, about to reproduce, and another at 7" do
      actual = School.new([0, 7]) |> School.day() |> List.keysort(0)
      expected = [{6, 2}, {8, 1}] |> List.keysort(0)
      assert actual == expected
    end

    test "with a fish at 7 and another at 0, about to reproduce" do
      actual = School.new([7, 0]) |> School.day() |> List.keysort(0)
      expected = [{6, 2}, {8, 1}] |> List.keysort(0)
      assert actual == expected
    end

    test "with two fish at 0" do
      actual = School.new([0, 0]) |> School.day() |> List.keysort(0)
      expected = [{6, 2}, {8, 2}] |> List.keysort(0)
      assert actual == expected
    end
  end

  describe "count" do
    test "with an empty school" do
      assert School.count([]) == 0
    end

    test "with an single item" do
      assert School.count([{1, 3}]) == 3
    end

    test "with two items" do
      assert School.count([{1, 3}, {2, 4}]) == 7
    end
  end
end
