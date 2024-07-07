defmodule Day9.Basin do
  def discover({x, y}, heightmap) do
    expand({x, y}, heightmap, MapSet.new())
  end

  defp expand({x, y}, heightmap, acc) when is_map_key(heightmap, {x, y}) do
    if Map.get(heightmap, {x, y}) == 9 or MapSet.member?(acc, {x, y}) do
      acc
    else
      acc = MapSet.put(acc, {x, y})

      spread({x, y})
      |> Enum.reduce(acc, &expand(&1, heightmap, &2))
    end
  end

  defp expand(_, _, acc), do: acc

  defp spread({x, y}) do
    [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1}
    ]
  end
end
