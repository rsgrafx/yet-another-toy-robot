defmodule ToyRobot.Robot do
  defstruct [:position, bad_coords: [], facing: :north]

  @right [:north, :east, :south, :west]
  @left [:north, :west, :south, :east]

  def new(position, facing \\ :north) do
    struct(__MODULE__, position: position, facing: facing)
  end

  def turn(%{facing: :east} = robot, :left) do
    %{robot | facing: :north}
  end

  def turn(robot, :left) do
    values = Enum.with_index(@left)
    idx = Keyword.get(values, robot.facing)
    %{robot | facing: Enum.at(@left, idx + 1)}
  end

  def turn(%{facing: :west} = robot, :right) do
    %{robot | facing: :north}
  end

  def turn(robot, :right) do
    values = Enum.with_index(@right)
    idx = Keyword.get(values, robot.facing)
    %{robot | facing: Enum.at(@right, idx + 1)}
  end
end
