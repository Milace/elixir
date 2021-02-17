defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end) # {:ok, pid_1}
  end

  def start_link_2 do
    Task.start_link(fn -> loop(%{}) end) # {:ok, pid_2}
  end

  defp loop(map) do
    receive do #case
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
