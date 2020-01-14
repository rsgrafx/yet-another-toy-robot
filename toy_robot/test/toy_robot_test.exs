defmodule ToyRobotTest do
  use ExUnit.Case

  setup do
    %{north_w: [0, 4], south_w: [0, 0], north_e: [4, 4], south_e: [4, 0]}
  end

  describe "Toy Robot table corners" do
    test ".table/2", context do
      table = ToyRobot.table(blocks: 5)

      # assert pos == [0, 0]
      assert List.first(table) == context.north_w
      assert Enum.at(table, 4) == context.north_e
      assert Enum.at(table, 20) == context.south_w
      assert Enum.at(table, 24) == context.south_e
    end
  end

  describe "ToyRobot.game/2" do
    test "Sets up a new game with initial position" do
      table = ToyRobot.table(blocks: 5)
      %{table: ^table, position: [0, 0]} = ToyRobot.game(:small, [0, 0])
    end
  end

  describe "ToyRobot.turn(:left)" do
    setup do
      %{game: ToyRobot.game(:small)}
    end

    test "current north - right turns", %{game: game} do
      %{facing: :east} = game = ToyRobot.turn(game, :right)
      %{facing: :south} = game = ToyRobot.turn(game, :right)
      %{facing: :west} = game = ToyRobot.turn(game, :right)
      %{facing: :north} = ToyRobot.turn(game, :right)
    end

    test "current north - left turns", %{game: game} do
      %{facing: :west} = game = ToyRobot.turn(game, :left)
      %{facing: :south} = game = ToyRobot.turn(game, :left)
      %{facing: :east} = game = ToyRobot.turn(game, :left)
      %{facing: :north} = ToyRobot.turn(game, :left)
    end
  end

  # Given a grid
  #
  # [
  #   [0, 4], [1, 4], [2, 4], [3, 4], [4, 4],
  #   [0, 3], [1, 3], [2, 3], [3, 3], [4, 3],
  #   [0, 2], [1, 2], [2, 2], [3, 2], [4, 2],
  #   [0, 1], [1, 1], [2, 1], [3, 1], [4, 1],
  #   [0, 0], [1, 0], [2, 0], [3, 0], [4, 0]
  # ]
  #

  describe "ToyRobot.move/1" do
    setup do
      %{table: ToyRobot.game(:small)}
    end

    test "Given position (0,0) table facing north."
    # Move position => (1, 0)

    test "Given position (2,1) facing east"
    # Move position => (2,0)

    test "Given position (2,1) facing north"
    # Move position => (3,1)

    test "Given position (4,4) facing north"
    # Move position => :noop || {:error, "you will fall off the table."}

    test "Given position (4,3) facing south"
    # Move position => (3,3)
  end
end
