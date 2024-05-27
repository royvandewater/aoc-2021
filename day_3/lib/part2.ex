defmodule Part2 do
  def part_2(items) do
    oxygen(items) * co2(items)
  end

  def oxygen(items) do
    items |> oxygen_item() |> Util.bin_to_int()
  end

  def oxygen_item([item]) do
    item
  end

  def oxygen_item(items) do
    most_popular_head = get_most_popular_head(items)

    tail =
      items
      |> Enum.filter(&(List.first(&1) == most_popular_head))
      |> Enum.map(&Enum.drop(&1, 1))

    [most_popular_head | oxygen_item(tail)]
  end

  def get_most_popular_head(items) do
    number_of_1s = items |> Enum.map(&List.first/1) |> Enum.count(&(&1 == 1))

    case number_of_1s < Enum.count(items) / 2 do
      true -> 0
      false -> 1
    end
  end

  def co2(items) do
    items |> co2_item() |> Util.bin_to_int()
  end

  def co2_item([item]) do
    item
  end

  def co2_item(items) do
    least_popular_head = get_least_popular_head(items)

    tail =
      items
      |> Enum.filter(&(List.first(&1) == least_popular_head))
      |> Enum.map(&Enum.drop(&1, 1))

    [least_popular_head | co2_item(tail)]
  end

  def get_least_popular_head(items) do
    case get_most_popular_head(items) do
      0 -> 1
      1 -> 0
    end
  end
end
