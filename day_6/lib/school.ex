defmodule School do
  def new([]), do: []

  def new([head | tail]) do
    new(tail)
    |> insert_or_increment(head)
  end

  def count([]), do: 0
  def count([{_, n} | tail]), do: n + count(tail)

  defp insert_or_increment(list, value) do
    {value, n} = List.keyfind(list, value, 0, {value, 0})
    List.keystore(list, value, 0, {value, n + 1})
  end

  def day(school) do
    school
    |> Enum.reduce([], &day_fish/2)
  end

  defp day_fish({0, count}, school) do
    # deal with existing 6's
    {6, n6} = List.keyfind(school, 6, 0, {6, 0})
    # deal with existing 8's
    {8, n8} = List.keyfind(school, 8, 0, {8, 0})

    school
    |> List.keystore(6, 0, {6, n6 + count})
    |> List.keystore(8, 0, {8, n8 + count})
  end

  defp day_fish({timer, count}, school) do
    new_timer = timer - 1
    {new_timer, n} = List.keyfind(school, new_timer, 0, {new_timer, 0})

    List.keystore(school, new_timer, 0, {new_timer, count + n})
  end
end
