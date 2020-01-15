defmodule ToyRobot.Moves do
  @moduledoc """
  Maintain logic that determines where a robot can move
  on the board.
  """

  def move(%{position: [x, y], facing: :north} = robot) do
    new_position = [x, y + 1]
    %{robot | position: new_position}
  end

  def move(%{position: [x, y], facing: :south} = robot) do
    new_position = [x, y - 1]
    %{robot | position: new_position}
  end

  def move(%{position: [x, y], facing: :east} = robot) do
    new_position = [x + 1, y]
    %{robot | position: new_position}
  end

  def move(%{position: [x, y], facing: :west} = robot) do
    new_position = [x - 1, y]
    %{robot | position: new_position}
  end
end
