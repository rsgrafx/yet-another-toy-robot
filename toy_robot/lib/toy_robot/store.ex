defmodule ToyRobot.Store do
  def fetch do
    cond do
      File.exists?("game_play_set") -> :dets.open_file(:game_play_set)
      true -> :dets.open_file(:game_play_set, type: :set)
    end
  end
end
