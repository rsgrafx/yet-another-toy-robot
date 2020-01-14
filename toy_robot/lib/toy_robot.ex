defmodule ToyRobot do
  @doc "Generate base table - grid"

  def moves() do
    [:n, :s, :e, :w]
  end

  @doc """
  Builds table grid with 0,0 at S/W and 4,$ at NE corners
  [
    [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
    [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
    [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
    [1, 0], [1, 1], [1, 2], [1, 3], [1, 4],
    [0, 0], [0, 1], [0, 2], [0, 3], [0, 4]
  ]
  """
  def table(point_x, point_y) when is_integer(point_x) and is_integer(point_y) do
    data =
      for x <- point_x..0,
          y <- point_y..0,
          do: [x, y]

    Enum.chunk_every(data, 5)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.reduce([], fn i, acc -> acc ++ i end)
  end
end
