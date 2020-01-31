defmodule ToyRobot do
  @moduledoc """
    Generate base table - grid
  """

  alias ToyRobot.{Game, Robot, Moves, Table}

  def game(position \\ [0, 0], facing \\ :north, blocks \\ 5)

  def game(position, facing, blocks) do
    table = Table.new(blocks: blocks)
    robot = Robot.new(position, facing)
    valid_start(position, table, robot)
  end

  def turn_robot(game, :left) do
    %{game | robot: Robot.turn(game.robot, :left)}
  end

  def turn_robot(game, :right) do
    %{game | robot: Robot.turn(game.robot, :right)}
  end

  def move(game) do
    %{game | robot: Moves.move(game.robot, game.table, [game.blocked])}
  end

  defp valid_start(position, table, robot) do
    if position in table do
      Game.new(table, robot)
    else
      raise ToyRobotGameError, "Please try a valid start position"
    end
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

defmodule ToyRobotGameError do
  defexception [:message]
end
