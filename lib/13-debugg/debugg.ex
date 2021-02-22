defmodule Debug do
  def traditional do
    [1,2,3]
    |> IO.inspect(label: "antes")
    |> Enum.map(&(&1 * 2))
    |> IO.inspect(label: "despues")
    |> Enum.sum
  end

  def with_inspect_vars(a, b, c) do
    IO.inspect binding() # devuelve una keyword list, con los parametros de entrada
    "hola"
  end

  def with_debug(a,b,c) do
    require IEx; IEx.pry
    var = "hola 3"
    hello = 2
  end
end
