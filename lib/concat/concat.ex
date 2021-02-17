defmodule Concat do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b), do: a

  def join(a, b, sep) do
    a <> sep <> b
  end

  #
# Input 01
#   aacccbbaa
# Output 01
#   acba
#
# Input 02
#   abc
# Output 02
#   abc
#
# Input 03
#   pprrqq
# Output 03
#   prq
#

  # Ejercicio reduccion
  def reduction(n) do
    reductionp(String.codepoints(n))
  end

  defp reductionp([], list), do: Enum.join(list)

  defp reductionp([head | tail], list \\ []) do
    result =
      cond do
        head in list -> list
        head not in list -> list ++ [head]
      end

    reductionp(tail, result)
  end

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false

  # def otra_funcion(numero), do: numero + 1
  @spec mi_funcion(fun()) :: number()
  def mi_funcion(fun) when is_function(fun, 1) do
    fun.(1)
  end

  def mi_funcion(fun) when is_function(fun, 2) do
    fun.(2, 2)
  end

end
