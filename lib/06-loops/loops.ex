defmodule ForLoop do
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i + 1, n, value)

      true ->
        :ok
    end
  end
end
