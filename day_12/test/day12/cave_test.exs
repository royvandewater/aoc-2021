defmodule Day12.CaveTest do
  use ExUnit.Case
  alias Day12.Cave

  describe "paths" do
    test "shortest path" do
      assert Cave.paths(%{:start => [:end], :end => [:start]}) == MapSet.new([[:start, :end]])
    end

    test "two hops this time" do
      input = %{
        :start => [:a],
        :a => [:start, :end],
        :end => [:a],
      }

      expected = [[:start, :a, :end]]

      assert Cave.paths(input) == MapSet.new(expected)
    end

    test "two possible paths" do
      input = %{
        :start => [:a, :b],
        :a => [:start, :end],
        :b => [:start, :end],
      }

      expected = [
        [:start, :a, :end],
        [:start, :b, :end],
      ]

      assert Cave.paths(input) == MapSet.new(expected)
    end

    test "multiple visits allowed" do
      input = %{
        :start => [:A],
        :A => [:start, :b, :end],
        :b => [:A, :end],
        :end => [:A, :b],
      }

      expected = [
        [:start, :A, :end],
        [:start, :A, :b, :end],
        [:start, :A, :b, :A, :end],
      ]

      assert Cave.paths(input) == MapSet.new(expected)
    end

    test "example 1" do
      input = %{
        :start => [:b, :A],
        :c => [:A],
        :d => [:b],
        :b => [:end, :d, :A, :start],
        :A => [:end, :b, :c, :start],
        :end => [:b, :A],
      }

      expected =
        MapSet.new([
          [:start, :A, :b, :A, :c, :A, :end],
          [:start, :A, :b, :A, :end],
          [:start, :A, :b, :end],
          [:start, :A, :c, :A, :b, :A, :end],
          [:start, :A, :c, :A, :b, :end],
          [:start, :A, :c, :A, :end],
          [:start, :A, :end],
          [:start, :b, :A, :c, :A, :end],
          [:start, :b, :A, :end],
          [:start, :b, :end],
        ])

      output = Cave.paths(input)

      assert MapSet.difference(expected, output) == MapSet.new([])

      assert Cave.paths(input) == MapSet.new(expected)
    end
  end

  describe "flatten_1" do
    test "empty list" do
      assert Cave.flatten_1([]) == []
    end

    test "one item" do
      assert Cave.flatten_1([[[1, 2]]]) == [[1, 2]]
    end

    test "two items" do
      assert Cave.flatten_1([[[1, 2], [2, 3]], [[4, 5]]]) == [[1, 2], [2, 3], [4, 5]]
    end
  end
end
