defmodule Day10Test do
  use ExUnit.Case

  describe "parse!" do
    test "empty input" do
      assert Day10.parse!("") == []
    end

    test "one char" do
      assert Day10.parse!("]") == ["]"]
    end

    test "two lines" do
      assert Day10.parse!("""
               1
               2
             """) == ["1", "2"]
    end
  end

  describe "part_1" do
    test "empty input" do
      assert Day10.part_1([]) == 0
    end

    test "example 1" do
      input =
        Day10.parse!("""
          [({(<(())[]>[[{[]{<()<>>
          [(()[<>])]({[<{<<[]>>(
          {([(<{}[<>[]}>{[]{[(<()>
          (((({<>}<{<{<>}{[]{[]{}
          [[<[([]))<([[{}[[()]]]
          [{[{({}]{}}([{[{{{}}([]
          {<[[]]>}<{[{[{[]{()[[[]
          [<(<(<(<{}))><([]([]()
          <{([([[(<>()){}]>(<<{{
          <{([{{}}[<[[[<>{}]]]>[]]
        """)

      assert Day10.part_1(input) == 26397
    end
  end

  describe "part_2" do
    test "example 1" do
      input =
        Day10.parse!("""
          [({(<(())[]>[[{[]{<()<>>
          [(()[<>])]({[<{<<[]>>(
          {([(<{}[<>[]}>{[]{[(<()>
          (((({<>}<{<{<>}{[]{[]{}
          [[<[([]))<([[{}[[()]]]
          [{[{({}]{}}([{[{{{}}([]
          {<[[]]>}<{[{[{[]{()[[[]
          [<(<(<(<{}))><([]([]()
          <{([([[(<>()){}]>(<<{{
          <{([{{}}[<[[[<>{}]]]>[]]
        """)

      assert Day10.part_2(input) == 288_957
    end
  end
end
