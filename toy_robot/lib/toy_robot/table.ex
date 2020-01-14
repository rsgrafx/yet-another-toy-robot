defmodule ToyRobot.Table do
  @moduledoc """
   Build the Toy Robot Table.
  """
  def new([point_x, point_y]) do
    data =
      for x <- point_x..0,
          y <- point_y..0,
          do: [x, y]

    Enum.chunk_every(data, 5)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.reduce([], fn i, acc -> acc ++ i end)
  end
end
