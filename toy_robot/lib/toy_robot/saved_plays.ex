defmodule ToyRobot.SavedPlays do
  use GenServer

  # Start app
  def start_link(_) do
    with {:ok, table} <- ToyRobot.Store.fetch(),
         [{_, data}] <- :dets.lookup(table, "plays"),
         [{_, play}] <- :dets.lookup(table, "last_position") do
      GenServer.start_link(__MODULE__, %{position: play, plays: data}, name: :game_plays)
    end
  end

  # cast
  def add_play(play) do
    GenServer.cast(game_process(), {:play, play})
  end

  # call
  def get_plays() do
    GenServer.call(game_process(), :plays)
  end

  def get_last_position do
    GenServer.call(game_process(), :last_position)
  end

  def last_move(position) do
    GenServer.cast(game_process(), {:position, position})
  end

  def store do
    GenServer.stop(game_process(), :normal)
  end

  # Callbacks
  @impl true
  def init(data) do
    {:ok, data}
  end

  @impl true
  def handle_cast({:play, play}, %{plays: plays} = state) do
    new_set = [play | plays]
    {:noreply, %{state | plays: new_set}}
  end

  def handle_cast({:position, position}, state) do
    {:noreply, %{state | position: position}}
  end

  @impl true
  def handle_call(:plays, _, state) do
    {:reply, state.plays, state}
  end

  def handle_call(:last_position, _, state) do
    {:reply, state.position, state}
  end

  defp game_process do
    process = Process.whereis(:game_plays)

    cond do
      Process.alive?(process) -> process
      true -> :restart
    end
  end

  @impl true
  def terminate(_, state) do
    {:ok, table} = ToyRobot.Store.fetch()
    :dets.insert(table, {"plays", state.plays})
    :dets.insert(table, {"last_position", state.position})
    :dets.close(table)
    :shutdown
  end
end
