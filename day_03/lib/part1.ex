defmodule Part1 do
  def part_1(items) do
    gamma_rate(items) * epsilon_rate(items)
  end

  def gamma_rate([]) do
    0
  end

  def gamma_rate(items) do
    items
    |> represent()
    |> Util.bin_to_int()
  end

  def epsilon_rate(items) do
    items
    |> represent()
    |> invert()
    |> Util.bin_to_int()
  end

  def represent(list) do
    list
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.sum/1)
    |> Enum.map(fn n ->
      if n > Enum.count(list) / 2 do
        1
      else
        0
      end
    end)
  end

  def invert([]) do
    []
  end

  def invert([head | tail]) do
    value =
      case head do
        1 -> 0
        0 -> 1
      end

    [value | invert(tail)]
  end
end
