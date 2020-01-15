defmodule ToyRobot do
  @doc "Generate base table - grid"

  @right [:north, :east, :south, :west]
  @left [:north, :west, :south, :east]

  alias ToyRobot.{Game, Moves, Table}

  def game(:small, position \\ [0, 0]) do
    Table.new(blocks: 5)
    |> Game.new(position)
  end

  def turn(%{facing: :east} = game, :left) do
    %{game | facing: :north}
  end

  def turn(game, :left) do
    values = Enum.with_index(@left)
    idx = Keyword.get(values, game.facing)
    %{game | facing: Enum.at(@left, idx + 1)}
  end

  def turn(%{facing: :west} = game, :right) do
    %{game | facing: :north}
  end

  def turn(game, :right) do
    values = Enum.with_index(@right)
    idx = Keyword.get(values, game.facing)
    %{game | facing: Enum.at(@right, idx + 1)}
  end

  def move(game) do
    Moves.move(game)
  end

  @doc """
  Builds table grid with 0,0 at S/W and 4,$ at NE corners
  [
    [0, 4], [1, 4], [2, 4], [3, 4], [4, 4],
    [0, 3], [1, 3], [2, 3], [3, 3], [4, 3],
    [0, 2], [1, 2], [2, 2], [3, 2], [4, 2],
    [0, 1], [1, 1], [2, 1], [3, 1], [4, 1],
    [0, 0], [1, 0], [2, 0], [3, 0], [4, 0]
  ]
  """
  def table(size) do
    Table.new(size)
  end
end
