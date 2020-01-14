defmodule ToyRobotTest do
  use ExUnit.Case

  # Given a grid
  # [
  #   [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
  #   [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
  #   [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
  #   [1, 0], [1, 1], [1, 2], [1, 3], [1, 4],
  #   [0, 0], [0, 1], [0, 2], [0, 3], [0, 4]
  # ]

  setup do
    %{north_w: [4, 0], south_w: [0, 0], north_e: [4, 4], south_e: [0, 4]}
  end

  describe "Toy Robot table" do
    test ".table/2", context do
      table = ToyRobot.table([4, 4])

      # assert pos == [0, 0]
      assert List.first(table) == context.north_w
      assert Enum.at(table, 4) == context.north_e
      assert Enum.at(table, 20) == context.south_w
      assert Enum.at(table, 24) == context.south_e
    end
  end

  describe "ToyRobot.game/2" do
    test "Sets up a new game with initial position" do
      table = ToyRobot.table([4, 4])
      %{table: ^table, position: [0, 0]} = ToyRobot.game(:small, [0, 0])
    end
  end
end
