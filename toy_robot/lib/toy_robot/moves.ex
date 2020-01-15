defmodule ToyRobot.Moves do
  @moduledoc """
  Maintain logic that determines where a robot can move
  on the board.
  """

  def move(%{position: [x, y], facing: :north} = game) do
    new_position = [x, y + 1]
    %{game | position: new_position}
  end

  def move(%{position: [x, y], facing: :south} = game) do
    new_position = [x, y - 1]
    %{game | position: new_position}
  end

  def move(%{position: [x, y], facing: :east} = game) do
    new_position = [x + 1, y]
    %{game | position: new_position}
  end

  def move(%{position: [x, y], facing: :west} = game) do
    new_position = [x - 1, y]
    %{game | position: new_position}
  end
end
