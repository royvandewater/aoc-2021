defmodule Day10.IncompleteTest do
  use ExUnit.Case
  alias Day10.Incomplete
  alias Day10.Incomplete, as: Incomplete

  describe "score_line" do
    test "an empty line" do
      assert Incomplete.score_line("") == 0
    end

    test "an open (" do
      assert Incomplete.score_line("(") == 1
    end

    test "an open [" do
      assert Incomplete.score_line("[") == 2
    end

    test "an open {" do
      assert Incomplete.score_line("{") == 3
    end

    test "an open <" do
      assert Incomplete.score_line("<") == 4
    end

    test "an open ([" do
      # (2 * 5) + 1
      assert Incomplete.score_line("([") == 11
    end

    test "a closed [()" do
      # (1 * 5) + 2
      assert Incomplete.score_line("[()") == 2
    end
  end
end
