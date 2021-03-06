defmodule ToyRobot.UI.CLI do
  @example_usage """
  ### Available commands
      PLACE 0,0,NORTH
      MOVE
      REPORT
  """

  @moduledoc """
    Example Input and Output
    ------------------------
    #{@example_usage}

    Expected output:
        0,1,NORTH

    ### Example b

        PLACE 0,0,NORTH
        LEFT
        REPORT

    Expected output:

        0,0,WEST

    ### Example c

        PLACE 1,2,EAST
        MOVE
        MOVE
        LEFT
        MOVE
        REPORT
  """

  def main(data \\ []) do
    parse_and_process(data)
  end

  defp parse_and_process(data) do
    {params, _, _} = OptionParser.parse(data, switches: [help: :boolean])
    start(params)
  end

  defp start(_) do
    loop_game()
  end

  defp loop_game(game \\ nil)

  defp loop_game(nil = game) do
    values = ToyRobot.SavedPlays.get_last_position()
    IO.inspect(values, label: "Start from previous game position >>")
    command(gets(), game)
  end

  defp loop_game(game) do
    command(gets(), game)
  end

  defp gets() do
    IO.gets("> ")
    |> String.trim()
    |> String.downcase()
    |> String.split(" ")
  end

  defp command(["help" | _], game) do
    IO.puts("""
    Available commands
    > place - # Example usage
      place 1,1 west #default direction is north

    > help - brings up this prompt
    > right - turns robot 90 deg right
    > left - turns robot 90 deg left
    > move - Robot advances current direction one position
    """)

    loop_game(game)
  end

  defp command(["place"], game) do
    command(["report"], game)
  end

  defp command(["place", params], _game) do
    game = ToyRobot.game(to_coords(params))
    loop_game(game)
  end

  defp command(["place", params, facing] = _data, _game) do
    game = ToyRobot.game(to_coords(params), String.to_atom(facing))
    loop_game(game)
  end

  defp command(["left"], game) do
    game
    |> ToyRobot.turn_robot(:left)
    |> loop_game()
  end

  defp command(["right"], game) do
    game
    |> ToyRobot.turn_robot(:right)
    |> loop_game()
  end

  defp command(["move"], game) do
    game
    |> ToyRobot.move()
    |> loop_game()
  end

  defp command(["report"], game = nil) do
    IO.puts(~s|Please start game by placing the rocket on the table.
# Eg. place 1,2 west
    |)
    loop_game(game)
  end

  defp command(["report"], game) do
    IO.inspect(game)
    loop_game(game)
  end

  defp command([v], _) when v in ["quit", "q"] do
    ToyRobot.SavedPlays.store()
    System.halt()
  end

  defp command(command, game) do
    IO.inspect(game, label: "unknown: #{command}")
    loop_game(game)
  end

  defp to_coords(params) do
    [x, y] = String.split(params, ",")
    [String.to_integer(x), String.to_integer(y)]
  end
end
