defmodule ToyRobot.Game do
  defstruct [:robot, :table, blocked: []]

  def new(table, robot, blocked \\ [1, 2]) do
    struct(__MODULE__, table: table, robot: robot, blocked: blocked)
  end
end

defimpl Inspect, for: ToyRobot.Game do
  def inspect(nil, _) do
    "No Game started yet."
  end

  def inspect(data, _) do
    grid = ToyRobot.UI.Grid.print(data)
    ~s|
#{grid}
Robot position: #{inspect(data.robot.position)}
Facing: #{data.robot.facing}
    |
  end
end
