defmodule ToyRobot.SavePlaysTest do
  use ExUnit.Case

  alias ToyRobot.SavedPlays

  setup do
    {:ok, process} = SavedPlays.start_link([])
    {:ok, process: process}
  end

  describe "SavedPlays.report/0" do
    # test "this should not work"

    test "should add last move", %{process: pid} do
      SavedPlays.add_play(pid, {"move", [1, 2]})
      SavedPlays.add_play(pid, {"move", [1, 1]})
      SavedPlays.add_play(pid, "right")
      SavedPlays.add_play(pid, "right")

      assert ["right", "right", {"move", [1, 1]}, {"move", [1, 2]}] ==
               SavedPlays.report(pid)
    end
  end
end
