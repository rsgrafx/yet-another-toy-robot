defmodule ToyRobot.Game do
  defstruct [:robot, :table]

  def new(table, robot) do
    struct(__MODULE__, table: table, robot: robot)
  end
end

defimpl Inspect, for: ToyRobot.Game do
  def inspect(nil, _) do
    "No Game started yet."
  end

  def inspect(data, _) do
    """
    Robot position: #{inspect(data.robot.position)}
    Facing: #{data.robot.facing}
    """
  end
end
