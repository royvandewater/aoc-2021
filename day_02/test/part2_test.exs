defmodule Part2Test do
  use ExUnit.Case

  test "part_2 example 1" do
    input = [
      {:forward, 5},
      {:down, 5},
      {:forward, 8},
      {:up, 3},
      {:down, 8},
      {:forward, 2}
    ]

    assert Part2.part_2(input) == 900
  end

  test "next when empty" do
    assert Part2.next([]) == %{horizontal: 0, depth: 0, aim: 0}
  end

  test "next when forward 1" do
    assert Part2.next([{:forward, 1}]) == %{horizontal: 1, depth: 0, aim: 0}
  end

  test "next when forward 2" do
    assert Part2.next([{:forward, 2}]) == %{horizontal: 2, depth: 0, aim: 0}
  end

  test "next when two forwards" do
    assert Part2.next([{:forward, 1}, {:forward, 2}]) == %{horizontal: 3, depth: 0, aim: 0}
  end

  test "next when down 1" do
    assert Part2.next([{:down, 1}]) == %{horizontal: 0, depth: 0, aim: 1}
  end

  test "next when down 2" do
    assert Part2.next([{:down, 2}]) == %{horizontal: 0, depth: 0, aim: 2}
  end

  test "next when down 1, then down 2" do
    assert Part2.next([{:down, 1}, {:down, 2}]) == %{horizontal: 0, depth: 0, aim: 3}
  end

  test "next when down 1, then forward 2" do
    assert Part2.next([{:down, 1}, {:forward, 2}]) == %{horizontal: 2, depth: 2, aim: 1}
  end

  test "next when down 1, then forward 2, then forward 3" do
    input = [{:down, 1}, {:forward, 2}, {:forward, 3}]
    assert Part2.next(input) == %{horizontal: 5, depth: 5, aim: 1}
  end

  test "next when forward 1, then down 2" do
    assert Part2.next([{:forward, 1}, {:down, 2}]) == %{horizontal: 1, depth: 0, aim: 2}
  end

  test "next when forward 1, then down 2, then down 1" do
    input = [{:down, 2}, {:forward, 1}, {:down, 1}]
    assert Part2.next(input) == %{horizontal: 1, depth: 2, aim: 3}
  end

  test "next up 1" do
    assert Part2.next([{:up, 1}]) == %{horizontal: 0, depth: 0, aim: -1}
  end

  test "next up 2" do
    assert Part2.next([{:up, 2}]) == %{horizontal: 0, depth: 0, aim: -2}
  end

  test "next up 2, then up 1" do
    assert Part2.next([{:up, 2}, {:up, 1}]) == %{horizontal: 0, depth: 0, aim: -3}
  end

  test "next forward 1, then up 2" do
    assert Part2.next([{:forward, 1}, {:up, 2}]) == %{horizontal: 1, depth: 0, aim: -2}
  end

  test "next up 2, forward 1, then up 1" do
    assert Part2.next([{:up, 2}, {:forward, 1}, {:up, 1}]) == %{horizontal: 1, depth: -2, aim: -3}
  end
end
