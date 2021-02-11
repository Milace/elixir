defmodule CursoElixir do
  @personas [%{firstname: "Milthon", lastname: "Ceballos"},
             %{firstname: "Nicole", lastname: "Ceballos"},
             %{firstname: "Adriana", lastname: "Castaño"}]

  @numeros [1,2,3,4,5,6,7,8]

  #buscar
  def buscar([]), do: "No hay mas items"

  def buscar([%{firstname: firstname, lastname: lastname} | tail] = list \\ @personas) do
    IO.inspect(tail, label: "-->")
    IO.puts "Hola mi nombre es #{firstname} #{lastname}"
    buscar(tail)
  end

  #sumar
  def sumar([], suma ), do: suma

  def sumar([head | tail] \\ @numeros, suma \\ 0) do
    resultado = suma + head
    sumar(tail, resultado)
  end


  #generico
  def generico([], suma, _funcion ), do: suma

  def generico([head | tail] \\ @numeros, suma \\ 0, funcion) do
    resultado = funcion.(suma , head)
    generico(tail, resultado, funcion)
  end


  #bucarNombres
  def buscarNombres() do
    Enum.map(@personas, fn (key) -> "Hola mi nombre #{key.firstname} y mi apellido es #{key.lastname}" end)
  end

 #buscarNumero
  def buscarNumero([], _), do: false

  def buscarNumero([head | tail], numero) do
    if head == numero do
      IO.puts(true)
    else
      buscarNumero(tail, numero);
    end
  end

  #contar cantidad elementos de una lista
  def contar([], count), do: "La lista tiene #{count} elementos."

  def contar([_ | tail], count) do
    count = count + 1
    contar(tail, count)
  end



  #concatenar todos los elementos de una lista
  def concatenar_elementos([], concat), do: {:ok, concat}

  def concatenar_elementos([head | _tail], _concat) when is_number(head) do
    {:error, "Hay un numero en la lista."}
  end

  def concatenar_elementos([head | tail], concat \\ "") when is_binary(head) do
    concat = concat <> head
    concatenar_elementos(tail, concat)
  end
end
