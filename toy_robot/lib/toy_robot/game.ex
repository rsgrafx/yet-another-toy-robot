defmodule ToyRobot.Game do
  defstruct [:table, :position]

  def new(table, position) do
    struct(__MODULE__, table: table, position: position)
  end
end
