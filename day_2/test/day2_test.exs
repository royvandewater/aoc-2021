defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "example 1" do
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

  test "parse when empty" do
    input = ""
    assert Day2.parse(input) == []
  end

  test "parse when one instruction" do
    input = "forward 5"
    assert Day2.parse(input) == [{:forward, 5}]
  end

  test "horizontal when empty" do
    assert Day2.horizontal([]) == 0
  end

  test "horizontal when forward 1" do
    assert Day2.horizontal([{:forward, 1}]) == 1
  end

  test "horizontal when forward 2" do
    assert Day2.horizontal([{:forward, 2}]) == 2
  end

  test "horizontal when two forwards" do
    assert Day2.horizontal([{:forward, 1}, {:forward, 2}]) == 3
  end

  test "horizontal when down 1" do
    assert Day2.horizontal([{:down, 1}]) == 0
  end

  test "horizontal when down 1, then forward 2" do
    assert Day2.horizontal([{:down, 1}, {:forward, 2}]) == 2
  end

  test "vertical when empty" do
    assert Day2.vertical([]) == 0
  end

  test "vertical down 1" do
    assert Day2.vertical([{:down, 1}]) == 1
  end

  test "vertical down 2" do
    assert Day2.vertical([{:down, 2}]) == 2
  end

  test "vertical down 1, then down 2" do
    assert Day2.vertical([{:down, 1}, {:down, 2}]) == 3
  end

  test "vertical up 1" do
    assert Day2.vertical([{:up, 1}]) == -1
  end

  test "vertical up 2" do
    assert Day2.vertical([{:up, 2}]) == -2
  end

  test "vertical up 2, then up 1" do
    assert Day2.vertical([{:up, 2}, {:up, 1}]) == -3
  end

  test "vertical forward 1" do
    assert Day2.vertical([{:forward, 1}]) == 0
  end

  test "vertical forward 1, then down 2" do
    assert Day2.vertical([{:forward, 1}, {:down, 2}]) == 2
  end
end
