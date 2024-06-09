defmodule Day8 do
  use Application

  def start(_type, _args) do
    IO.puts("Day 8")

    input = File.read!("./input.txt") |> parse!()

    IO.puts("part 1: #{part_1(input)}")
    IO.puts("part 2: #{part_2(input)}")

    {:ok, self()}
  end

  def parse!(str) do
    str
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line!/1)
  end

  def parse_line!(str) do
    str
    |> String.split(" | ", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> List.to_tuple()
  end

  def part_1([]), do: 0

  def part_1([head | tail]) do
    {_, output_values} = head

    count_simple_digits(output_values) + part_1(tail)
  end

  def part_2(input) do
    input
    |> Enum.map(&decode/1)
    |> Enum.sum()
  end

  defp count_simple_digits(values), do: Enum.count(values, &is_known?/1)

  defp is_known?(str) do
    is_1?(str) || is_4?(str) || is_7?(str) || is_8?(str)
  end

  def is_1?(str), do: String.length(str) == 2
  def is_4?(str), do: String.length(str) == 4
  def is_7?(str), do: String.length(str) == 3
  def is_8?(str), do: String.length(str) == 7

  def decode({signal, output}) do
    table = generate_lookup(signal)

    output |> Enum.map(&lookup(&1, table)) |> Enum.join("") |> String.to_integer()
  end

  def generate_lookup(signal) do
    normalized_keys = Enum.map(signal, &normalize_key/1)

    # |> find_and_add_6(normalized_keys)
    %{}
    |> Map.put(Enum.find(normalized_keys, &is_1?/1), 1)
    |> Map.put(Enum.find(normalized_keys, &is_4?/1), 4)
    |> Map.put(Enum.find(normalized_keys, &is_7?/1), 7)
    |> Map.put(Enum.find(normalized_keys, &is_8?/1), 8)
    |> find_and_add_9(normalized_keys)
    |> find_and_add_6(normalized_keys)
    |> find_and_add_3(normalized_keys)
    |> find_and_add_5(normalized_keys)
    |> find_and_add_2(normalized_keys)
    |> find_and_add_0(normalized_keys)
  end

  def find_and_add_9(table, keys) do
    transposed = transpose(table)

    code_1 = transposed[1]
    code_4 = transposed[4]

    key =
      keys
      # matches 6,9,0
      |> Enum.filter(&has_length?(&1, 6))
      # matches 9,0
      |> Enum.filter(&contains_all_chars_of(&1, code_1))
      # matches 9
      |> Enum.find(&contains_all_chars_of(&1, code_4))

    Map.put(table, key, 9)
  end

  def find_and_add_6(table, keys) do
    transposed = transpose(table)
    code_1 = transposed[1]

    key =
      keys
      # matches 6,9,0
      |> Enum.filter(&has_length?(&1, 6))
      # matches 6
      |> Enum.reject(&contains_all_chars_of(&1, code_1))
      |> Enum.to_list()
      |> List.first()

    Map.put(table, key, 6)
  end

  def find_and_add_3(table, keys) do
    code_1 =
      table
      |> transpose()
      |> Map.fetch!(1)

    key =
      keys
      |> Enum.filter(&has_length?(&1, 5))
      |> Enum.find(&contains_all_chars_of(&1, code_1))

    Map.put(table, key, 3)
  end

  def find_and_add_5(table, keys) do
    code_6 =
      table
      |> transpose()
      |> Map.fetch!(6)

    key =
      keys
      |> Enum.filter(&has_length?(&1, 5))
      |> Enum.find(&contains_all_chars_of(code_6, &1))

    Map.put(table, key, 5)
  end

  def find_and_add_2(table, keys) do
    five_digit_keys = keys |> Enum.filter(&has_length?(&1, 5)) |> MapSet.new()
    used_keys = table |> Map.keys() |> MapSet.new()

    key = MapSet.difference(five_digit_keys, used_keys) |> MapSet.to_list() |> List.first()

    Map.put(table, key, 2)
  end

  def find_and_add_0(table, keys) do
    all_keys = MapSet.new(keys)
    used_keys = table |> Map.keys() |> MapSet.new()

    key = MapSet.difference(all_keys, used_keys) |> MapSet.to_list() |> List.first()

    Map.put(table, key, 0)
  end

  def contains_all_chars_of(haystack, needle) do
    needle_chars = needle |> String.split("")
    Enum.all?(needle_chars, &String.contains?(haystack, &1))
  end

  def has_length?(str, length), do: String.length(str) == length

  def transpose(table) do
    for {k, v} <- table, into: %{}, do: {v, k}
  end

  def lookup(key, table), do: table[normalize_key(key)]

  def normalize_key(key) do
    key
    |> String.split("", trim: true)
    |> Enum.sort()
    |> Enum.join("")
  end
end
