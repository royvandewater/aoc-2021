defmodule Day4 do
  use Application

  def start(_type, _args) do
    IO.puts("Day 4")
    [numbers, boards] = File.read!("./input.txt") |> parse!()

    IO.puts("part 1: #{part_1(numbers, boards)}")
    IO.puts("part 2: #{part_2(numbers, boards)}")

    {:ok, self()}
  end

  def parse!(string) do
    [head | rest] = string |> String.trim() |> String.split("\n\n", trim: true)

    numbers = head |> String.split(",", trim: true) |> Enum.map(&String.to_integer/1)
    boards = rest |> Enum.map(&Board.parse!/1)

    [numbers, boards]
  end

  def part_1([n | rest], boards) do
    new_boards = Enum.map(boards, &Board.mark(&1, n))
    winning_board = Enum.find(new_boards, &Board.wins?/1)

    if winning_board do
      n * Board.score(winning_board)
    else
      part_1(rest, new_boards)
    end
  end

  def part_2([n | rest], [board]) do
    new_board = Board.mark(board, n)

    if Board.wins?(new_board) do
      n * Board.score(new_board)
    else
      part_2(rest, [new_board])
    end
  end

  def part_2([n | rest], boards) do
    new_boards = boards |> Enum.map(&Board.mark(&1, n)) |> Enum.reject(&Board.wins?/1)
    part_2(rest, new_boards)
  end
end
