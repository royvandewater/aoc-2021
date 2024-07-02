defmodule Day10.Line do
  def open?("("), do: true
  def open?("{"), do: true
  def open?("["), do: true
  def open?("<"), do: true
  def open?(_), do: false

  def inverse?("(", ")"), do: true
  def inverse?("{", "}"), do: true
  def inverse?("[", "]"), do: true
  def inverse?("<", ">"), do: true
  def inverse?(_, _), do: false
end
