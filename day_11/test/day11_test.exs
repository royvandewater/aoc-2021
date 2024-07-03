defmodule Day11Test do
  use ExUnit.Case

  describe "parse!" do
    test "empty input" do
      assert Day11.parse!("") == []
    end

    test "one octopus" do
      assert Day11.parse!("1") == [[1]]
    end

    test "two octopi in a row" do
      assert Day11.parse!("12") == [[1, 2]]
    end

    test "two octopi in a column" do
      assert Day11.parse!("""
               1
               2
             """) == [[1], [2]]
    end
  end

  describe "part_1" do
    test "empty input" do
      assert Day11.part_1([]) == 0
    end

    test "example 1" do
      input =
        Day11.parse!("""
          5483143223
          2745854711
          5264556173
          6141336146
          6357385478
          4167524645
          2176841721
          6882881134
          4846848554
          5283751526
        """)

      assert Day11.part_1(input) == 1656
    end
  end

  # describe "part_2" do
  #   test "example 1" do
  #     input =
  #       Day11.parse!("""
  #         [({(<(())[]>[[{[]{<()<>>
  #         [(()[<>])]({[<{<<[]>>(
  #         {([(<{}[<>[]}>{[]{[(<()>
  #         (((({<>}<{<{<>}{[]{[]{}
  #         [[<[([]))<([[{}[[()]]]
  #         [{[{({}]{}}([{[{{{}}([]
  #         {<[[]]>}<{[{[{[]{()[[[]
  #         [<(<(<(<{}))><([]([]()
  #         <{([([[(<>()){}]>(<<{{
  #         <{([{{}}[<[[[<>{}]]]>[]]
  #       """)

  #     assert Day11.part_2(input) == 288_957
  #   end
  # end
end
