defmodule Day10.CorruptTest do
  use ExUnit.Case
  alias Day10.Corrupt, as: Corrupt

  describe "score_line" do
    test "empty input" do
      assert Corrupt.score_line("") == 0
    end

    test "unmatched )" do
      assert Corrupt.score_line(")") == 3
    end

    test "unmatched (" do
      assert Corrupt.score_line("(") == 0
    end

    test "matched () followed by unmatched )" do
      assert Corrupt.score_line("())") == 3
    end

    test "unmatched [[]}" do
      assert Corrupt.score_line("[[]}") == 1197
    end

    test "example 1, line 1" do
      input = "[({(<(())[]>[[{[]{<()<>>"
      assert Corrupt.score_line(input) == 0
    end

    test "example 1, line 2" do
      input = "[(()[<>])]({[<{<<[]>>("
      assert Corrupt.score_line(input) == 0
    end

    test "example 1, line 3" do
      input = "{([(<{}[<>[]}>{[]{[(<()>"
      assert Corrupt.score_line(input) == 1197
    end

    test "example 1, line 4" do
      input = "(((({<>}<{<{<>}{[]{[]{}"
      assert Corrupt.score_line(input) == 0
    end

    test "example 1, line 5" do
      input = "[[<[([]))<([[{}[[()]]]"
      assert Corrupt.score_line(input) == 3
    end

    test "example 1, line 6" do
      input = "[{[{({}]{}}([{[{{{}}([]"
      assert Corrupt.score_line(input) == 57
    end

    test "example 1, line 7" do
      input = "{<[[]]>}<{[{[{[]{()[[[]"
      assert Corrupt.score_line(input) == 0
    end

    test "example 1, line 8" do
      input = "[<(<(<(<{}))><([]([]()"
      assert Corrupt.score_line(input) == 3
    end

    test "example 1, line 9" do
      input = "<{([([[(<>()){}]>(<<{{"
      assert Corrupt.score_line(input) == 25137
    end

    test "example 1, line 10" do
      input = "<{([{{}}[<[[[<>{}]]]>[]]"
      assert Corrupt.score_line(input) == 0
    end
  end

  describe "first_illegal_character" do
    test "empty input" do
      assert Corrupt.first_illegal_character("") == nil
    end

    test "unmatched )" do
      assert Corrupt.first_illegal_character(")") == ")"
    end

    test "unmatched (" do
      assert Corrupt.first_illegal_character("(") == nil
    end

    test "matched () followed by unmatched )" do
      assert Corrupt.first_illegal_character("())") == ")"
    end

    test "unmatched [[]}" do
      assert Corrupt.first_illegal_character("[[]}") == "}"
    end

    test "example 1, line 1" do
      input = "[({(<(())[]>[[{[]{<()<>>"
      assert Corrupt.first_illegal_character(input) == nil
    end

    test "example 1, line 2" do
      input = "[(()[<>])]({[<{<<[]>>("
      assert Corrupt.first_illegal_character(input) == nil
    end

    test "example 1, line 3" do
      input = "{([(<{}[<>[]}>{[]{[(<()>"
      assert Corrupt.first_illegal_character(input) == "}"
    end

    test "example 1, line 4" do
      input = "(((({<>}<{<{<>}{[]{[]{}"
      assert Corrupt.first_illegal_character(input) == nil
    end

    test "example 1, line 5" do
      input = "[[<[([]))<([[{}[[()]]]"
      assert Corrupt.first_illegal_character(input) == ")"
    end

    test "example 1, line 6" do
      input = "[{[{({}]{}}([{[{{{}}([]"
      assert Corrupt.first_illegal_character(input) == "]"
    end

    test "example 1, line 7" do
      input = "{<[[]]>}<{[{[{[]{()[[[]"
      assert Corrupt.first_illegal_character(input) == nil
    end

    test "example 1, line 8" do
      input = "[<(<(<(<{}))><([]([]()"
      assert Corrupt.first_illegal_character(input) == ")"
    end

    test "example 1, line 9" do
      input = "<{([([[(<>()){}]>(<<{{"
      assert Corrupt.first_illegal_character(input) == ">"
    end

    test "example 1, line 10" do
      input = "<{([{{}}[<[[[<>{}]]]>[]]"
      assert Corrupt.first_illegal_character(input) == nil
    end
  end
end
