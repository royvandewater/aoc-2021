defmodule Day12Test do
  use ExUnit.Case

  describe "parse!" do
    test "smallest valid input" do
      assert Day12.parse!("start-end") == %{:start => [:end], :end => [:start]}
    end

    test "one hop" do
      input = """
        start-a
        a-end
      """

      assert Day12.parse!(input) == %{:start => [:a], :a => [:end, :start], :end => [:a]}
    end

    test "two paths" do
      input = """
        start-a
        start-b
        a-end
        b-end
      """

      assert Day12.parse!(input) == %{
               :start => [:b, :a],
               :a => [:end, :start],
               :b => [:end, :start],
               :end => [:b, :a],
             }
    end
  end

  describe "part_1" do
    test "example 1" do
      input =
        Day12.parse!("""
          start-A
          start-b
          A-c
          A-b
          b-d
          A-end
          b-end
        """)

      IO.puts(inspect(input))

      assert Day12.part_1(input) == 10
    end

    test "example 2" do
      input =
        Day12.parse!("""
          dc-end
          HN-start
          start-kj
          dc-start
          dc-HN
          LN-dc
          HN-end
          kj-sa
          kj-HN
          kj-dc
        """)

      assert Day12.part_1(input) == 19
    end

    test "example 3" do
      input =
        Day12.parse!("""
          fs-end
          he-DX
          fs-he
          start-DX
          pj-DX
          end-zg
          zg-sl
          zg-pj
          pj-he
          RW-he
          fs-DX
          pj-RW
          zg-RW
          start-pj
          he-WI
          zg-he
          pj-fs
          start-RW
        """)

      assert Day12.part_1(input) == 226
    end
  end

  describe "part_2" do
    test "empty input" do
      assert Day12.part_2([]) == 0
    end
  end
end
