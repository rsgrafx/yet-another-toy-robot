defmodule ToyRobot do
  @doc "Generate base table - grid"

  alias ToyRobot.{Game, Table}

  def game(:small, position \\ [0, 0]) do
    Table.new([4, 4])
    |> Game.new(position)
  end

  def moves() do
    [:n, :s, :e, :w]
  end

  @doc """
  Builds table grid with 0,0 at S/W and 4,$ at NE corners
  [
    [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
    [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
    [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
    [1, 0], [1, 1], [1, 2], [1, 3], [1, 4],
    [0, 0], [0, 1], [0, 2], [0, 3], [0, 4]
  ]
  """
  def table(size) do
    Table.new(size)
  end
end
