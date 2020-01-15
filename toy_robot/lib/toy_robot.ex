defmodule ToyRobot do
  @doc "Generate base table - grid"

  alias ToyRobot.{Game, Robot, Moves, Table}

  def game(:small, position \\ [0, 0]) do
    table = Table.new(blocks: 5)
    robot = Robot.new(position)
    Game.new(table, robot)
  end

  def turn_robot(game, :left) do
    %{game | robot: Robot.turn(game.robot, :left)}
  end

  def turn_robot(game, :right) do
    %{game | robot: Robot.turn(game.robot, :right)}
  end

  def move(game) do
    %{game | robot: Moves.move(game.robot)}
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
