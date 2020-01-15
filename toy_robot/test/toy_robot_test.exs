defmodule ToyRobotTest do
  use ExUnit.Case

  alias ToyRobot.Robot

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

      %{table: ^table, robot: %Robot{facing: :north, position: [0, 0]}} = ToyRobot.game([0, 0])
    end
  end

  describe "ToyRobot Game invalid start" do
    test "assert raise" do
      assert_raise ToyRobotGameError, fn ->
        ToyRobot.game([20, 20])
      end
    end
  end

  describe "ToyRobot.turn_robot(:left)" do
    setup do
      %{game: ToyRobot.game()}
    end

    test "current north - right turns", %{game: game} do
      game = ToyRobot.turn_robot(game, :right)
      assert game.robot.facing == :east
      game = ToyRobot.turn_robot(game, :right)
      assert game.robot.facing == :south
      game = ToyRobot.turn_robot(game, :right)
      assert game.robot.facing == :west
      game = ToyRobot.turn_robot(game, :right)
      assert game.robot.facing == :north
    end

    test "current north - left turns", %{game: game} do
      game = ToyRobot.turn_robot(game, :left)
      assert game.robot.facing == :west
      game = ToyRobot.turn_robot(game, :left)
      assert game.robot.facing == :south
      game = ToyRobot.turn_robot(game, :left)
      assert game.robot.facing == :east
      game = ToyRobot.turn_robot(game, :left)
      assert game.robot.facing == :north
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
    test "Given position (0,0) table facing north." do
      game = ToyRobot.game()
      game = ToyRobot.move(game)
      assert game.robot.position == [0, 1]
    end

    # Move position => (1, 0)

    test "Given position (2,1) moved twice facing east" do
      game = ToyRobot.game([2, 1])
      game = ToyRobot.turn_robot(game, :right)

      assert game.robot.facing == :east

      moved =
        game
        |> ToyRobot.move()
        |> ToyRobot.move()

      assert moved.robot.position == [4, 1]
    end

    test "Given position (0,2) [:right, :right, :move]" do
      game = ToyRobot.game([0, 2])

      turn_move =
        game
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.move()

      assert turn_move.robot.position == [0, 1]
    end

    # Move position => (3,1)

    test "Given position (4,4) [:right, :right, :right, :move]" do
      game = ToyRobot.game([4, 4])

      turn_move =
        game
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.move()
        |> ToyRobot.move()

      assert turn_move.robot.position == [4, 2]
    end

    # Move position => :noop || {:error, "you will fall off the table."}

    test "Given position (4,4) [:left, :move, :move, :right :move]" do
      game = ToyRobot.game([4, 4])

      turn_move =
        game
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()
        |> ToyRobot.move()
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()

      assert turn_move.robot.position == [2, 3]
    end

    test "Given position (2,2) end up right where you started." do
      game = ToyRobot.game([2, 2])

      back_to_beginning =
        game
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()
        |> ToyRobot.turn_robot(:left)
        |> ToyRobot.move()

      assert back_to_beginning.robot.position == [2, 2]
    end
  end

  describe "Handing Constraints on off table" do
    test "Given position (1, 0) [:right, :move, :move, :right, :move]" do
      game = ToyRobot.game([1, 0])

      dont_fall_off =
        game
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.move()
        |> ToyRobot.move()
        |> ToyRobot.turn_robot(:right)
        |> ToyRobot.move()

      assert dont_fall_off.robot.position == [3, 0]
      assert dont_fall_off.robot.bad_coords == [[3, -1]]
    end
  end
end
