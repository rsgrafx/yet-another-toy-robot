defmodule ToyRobot.Table do
  @moduledoc """
   Build the Toy Robot Table.
  """
  def new(blocks: units) do
    idx_last = units - 1
    results = for h <- idx_last..0, do: for(i <- 0..idx_last, do: [i, h])
    Enum.reduce(results, [], fn i, acc -> acc ++ i end)
  end
end
