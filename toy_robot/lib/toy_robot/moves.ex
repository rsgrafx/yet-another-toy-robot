defmodule ToyRobot.Moves do
  @moduledoc """
  Maintain logic that determines where a robot can move
  on the board.
  """
  defp can_move(position, robot, table, blocked_units) do
    if position in table and position not in blocked_units do
      %{robot | position: position}
    else
      IO.puts("Sorry. #{inspect(position)} blocked")
      %{robot | bad_coords: [position | robot.bad_coords]}
    end
  end

  def move(%{position: [x, y], facing: :north} = robot, table, blocked) do
    new_position = [x, y + 1]
    can_move(new_position, robot, table, blocked)
  end

  def move(%{position: [x, y], facing: :south} = robot, table, blocked) do
    new_position = [x, y - 1]
    can_move(new_position, robot, table, blocked)
  end

  def move(%{position: [x, y], facing: :east} = robot, table, blocked) do
    new_position = [x + 1, y]
    can_move(new_position, robot, table, blocked)
  end

  def move(%{position: [x, y], facing: :west} = robot, table, blocked) do
    new_position = [x - 1, y]
    can_move(new_position, robot, table, blocked)
  end
end
