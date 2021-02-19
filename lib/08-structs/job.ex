defmodule Job do
  defstruct [:name, user: %User{}, job2: "developer"]

  def compres() do
    IO.puts("hola")
    IO.inspect(%__MODULE__{}, label: "soy una estructura de job -->")
  end
end
