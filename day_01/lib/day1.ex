defmodule Day1 do
  def main do
    str = File.read!("./input.txt")

    count_1 = count_ascending(str)
    IO.puts("Day 1, part a: #{count_1}")

    count_2 = count_ascending(str, 3)
    IO.puts("Day 1, part b: #{count_2}")

    0
  end

  def count_ascending(input, window_size \\ 1) do
    input
    |> String.trim()
    |> String.split()
    |> Enum.map(&parse!/1)
    |> count_ascending_list(window_size)
  end

  def parse!(str) do
    str
    |> Integer.parse()
    |> Tuple.to_list()
    |> List.first()
  end

  def count_ascending_list([], _) do
    0
  end

  def count_ascending_list(list, window_size) do
    window = Enum.take(list, window_size)
    rest = Enum.drop(list, window_size)

    result =
      List.foldl(rest, [window, 0], fn item, acc ->
        [window, count] = acc

        new_window = slide_window(window, item)
        [new_window, count + increasing(window, new_window)]
      end)

    List.last(result)
  end

  def slide_window(window, item) do
    window
    |> Enum.drop(1)
    |> Enum.concat([item])
  end

  def increasing(window_1, window_2) do
    if Enum.sum(window_1) < Enum.sum(window_2) do
      1
    else
      0
    end
  end
end

Day1.main()
