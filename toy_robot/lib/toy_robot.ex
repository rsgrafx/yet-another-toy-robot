defmodule ToyRobot do
  @doc "Generate base table - grid"
  def table do
    for x <- 0..4,
        y <- 0..4,
        do: [x, y]
  end
end
