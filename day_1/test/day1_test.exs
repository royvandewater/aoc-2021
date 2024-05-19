defmodule Day1Test do
  use ExUnit.Case

  test "1: empty" do
    assert Day1.count_ascending("") == 0
  end

  test "1: two rows ascending" do
    input = "
      1
      2
    "
    assert Day1.count_ascending(input) == 1
  end

  test "1: two rows stagnant" do
    input = "
      1
      1
    "
    assert Day1.count_ascending(input) == 0
  end

  test "1: example 1" do
    input = "
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    "
    assert Day1.count_ascending(input) == 7
  end

  test "3: example 1" do
    input = "
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    "
    assert Day1.count_ascending(input, 3) == 5
  end
end
