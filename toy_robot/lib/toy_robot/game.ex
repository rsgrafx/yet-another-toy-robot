defmodule ToyRobot.Game do
  defstruct [:robot, :table]

  def new(table, robot) do
    struct(__MODULE__, table: table, robot: robot)
  end
end
