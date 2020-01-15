defmodule ToyRobot.Moves do
  @moduledoc """
  Maintain logic that determines where a robot can move
  on the board.
  """
  def can_move(position, robot, table) do
    if position in table do
      %{robot | position: position}
    else
      %{robot | bad_coords: [position | robot.bad_coords]}
    end
  end

  def move(%{position: [x, y], facing: :north} = robot, table) do
    new_position = [x, y + 1]
    can_move(new_position, robot, table)
  end

  def move(%{position: [x, y], facing: :south} = robot, table) do
    new_position = [x, y - 1]
    can_move(new_position, robot, table)
  end

  def move(%{position: [x, y], facing: :east} = robot, table) do
    new_position = [x + 1, y]
    can_move(new_position, robot, table)
  end

  def move(%{position: [x, y], facing: :west} = robot, table) do
    new_position = [x - 1, y]
    can_move(new_position, robot, table)
  end
end
