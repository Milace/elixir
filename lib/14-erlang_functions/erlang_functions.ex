defmodule ErlangFunctions do
  def string_function() do
    String.to_charlist("0") |> IO.inspect(label: "Elixir")
    :binary.bin_to_list("0") |> IO.inspect(label: "Erlang")
  end

  # def list() do
  #   :lists.append([[1,2,3], [a,b], [4,5,6]]) |> IO.inspect(label: "Erlang")
  # end

  def zip_function() do
    :zip.foldl(fn _,_,_,acc -> acc + 1 end, 0, :binary.bin_to_list("file.zip"))
  end

  def digraph() do
    digraph = :digraph.new()
    coords = [{0.0, 0.0},{1.0, 0.0},{1.0, 1.0}]
    [v0, v1, v2] = (for c <- coords, do: :digraph.add_vertex(digraph, c))
    IO.inspect(v0, label: "v0")
    IO.inspect(v1, label: "v1")
    IO.inspect(v2, label: "v2")

    :digraph.add_edge(digraph, v0,v1)
    :digraph.add_edge(digraph, v1,v2)
    :digraph.get_short_path(digraph, v0,v2) |> IO.inspect(label: "get")
  end
end
