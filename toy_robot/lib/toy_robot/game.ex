defmodule ToyRobot.Game do
  defstruct [:position, :table, facing: :north]

  def new(table, position) do
    struct(__MODULE__, table: table, position: position)
  end
end
