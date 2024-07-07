defmodule Util do
  def bin_to_int([]) do
    0
  end

  def bin_to_int([head | tail]) do
    n = Enum.count(tail)

    value = head * 2 ** n
    value + bin_to_int(tail)
  end
end
