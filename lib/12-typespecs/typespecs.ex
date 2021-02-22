defmodule TypeSpecs do
  @typedoc """
  4 digitos del año, por ejemplo: 1993
  """
  @type year :: integer

  @spec edad_actual(year) :: String
  def edad_actual(year) when is_integer(year), do: "el año de nacimiento es #{year}"

  @spec sumar(number, number) :: {number, String.t}
  def sumar(x,y), do: {x+y, "un mensaje"}
end
