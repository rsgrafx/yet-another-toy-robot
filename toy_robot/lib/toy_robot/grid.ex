defmodule ToyRobot.UI.Grid do
  @moduledoc """
  Handles creating a visual of current state of the grid.
  and places "rocket" :) in its place.


  |0,4|1,4|2,4|3,4|4,4|
  |0,3|1,3|2,3|3,3|4,3|
  |0,2|1,2|🚀 |3,2|4,2|
  |0,1|1,1|2,1|3,1|4,1|
  |0,0|1,0|2,0|3,0|4,0|
  """

  def print(game) do
    chunked = Enum.chunk(game.table, 5)
    for n <- chunked, do: row(n, game.robot.position)
  end

  defp row(list, position) do
    values = Enum.map(list, &match(&1, position))
    ~s{|#{values}\n}
  end

  defp match(a, a), do: "🚀 |"
  defp match([x, y], _), do: ~s[#{x},#{y}|]
end
