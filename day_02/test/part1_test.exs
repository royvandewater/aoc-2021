defmodule Part1Test do
  use ExUnit.Case

  test "part_1 example 1" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2}
    ]

    assert Part1.part_1(input) == 150
  end

  test "horizontal when empty" do
    assert Part1.horizontal([]) == 0
  end

  test "horizontal when forward 1" do
    assert Part1.horizontal([{:forward, 1}]) == 1
  end

  test "horizontal when forward 2" do
    assert Part1.horizontal([{:forward, 2}]) == 2
  end

  test "horizontal when two forwards" do
    assert Part1.horizontal([{:forward, 1}, {:forward, 2}]) == 3
  end

  test "horizontal when down 1" do
    assert Part1.horizontal([{:down, 1}]) == 0
  end

  test "horizontal when down 1, then forward 2" do
    assert Part1.horizontal([{:down, 1}, {:forward, 2}]) == 2
  end

  test "vertical when empty" do
    assert Part1.vertical([]) == 0
  end

  test "vertical down 1" do
    assert Part1.vertical([{:down, 1}]) == 1
  end

  test "vertical down 2" do
    assert Part1.vertical([{:down, 2}]) == 2
  end

  test "vertical down 1, then down 2" do
    assert Part1.vertical([{:down, 1}, {:down, 2}]) == 3
  end

  test "vertical up 1" do
    assert Part1.vertical([{:up, 1}]) == -1
  end

  test "vertical up 2" do
    assert Part1.vertical([{:up, 2}]) == -2
  end

  test "vertical up 2, then up 1" do
    assert Part1.vertical([{:up, 2}, {:up, 1}]) == -3
  end

  test "vertical forward 1" do
    assert Part1.vertical([{:forward, 1}]) == 0
  end

  test "vertical forward 1, then down 2" do
    assert Part1.vertical([{:forward, 1}, {:down, 2}]) == 2
  end
end
