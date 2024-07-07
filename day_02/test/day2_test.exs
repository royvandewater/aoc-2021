defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "parse when empty" do
    input = ""
    assert Day2.parse(input) == []
  end

  test "parse when one instruction" do
    input = "forward 5"
    assert Day2.parse(input) == [{:forward, 5}]
  end

  test "part 1, example 1" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2}
    ]

    assert Day2.part_1(input) == 150
  end

  test "part 2, example 1" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2}
    ]

    assert Day2.part_2(input) == 900
  end
end
