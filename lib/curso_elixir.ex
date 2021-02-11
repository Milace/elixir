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

  #Tringulo de pascal Ejemplo 1####################
  def pascal1(1), do: (IO.puts("1"); [1])
  def pascal1(current_level) do
    list = pascal1(current_level - 1)
    new_list = [1] ++ for(x <- 0..length(list)-1, do: Enum.at(list, x) + Enum.at(list, x+1, 0))
    Enum.join(new_list, " ") |> IO.puts
    new_list
  end

  #Tringulo de pascal Ejemplo 2###################
  #def pascal2(n), do: pascal2(n,[1])
  def pascal2(1,list), do: list
  def pascal2(n,list \\ [1]) do
  #def pascal2(n,list) do
    IO.inspect list
    new_list = Enum.zip([0]++list, list++[0]) |> Enum.map(fn {a,b} -> a+b end)
    pascal2(n-1,new_list)
  end

  #Fibonacci######################################
  def fibonacci(n) do
    if (n < 2) do
      n
    else
      fibonacci(n - 2) + fibonacci(n - 1)
    end
  end

  #Ejercicio #1
  def ejer1(0, sum), do: sum

  def ejer1(n, sum \\ 0) do
    sum = sum + n
    ejer1(n-1, sum)
  end

  def ejer11(n) do
    Enum.sum(0..n)
  end

  #Ejercicio #2
  def ejer2(n) do
    if n > 0 do
      Enum.map(1..n, &(&1))
    end
  end

  def ejer21(n) do
    fibo = 
    cond do
      n > 2 -> fibonacci(n-1) + fibonacci(n-2)
      n == 1 or n == 2 -> 1
    end
  end

  #Ejercicio #3
  def ejer3(a,b) do
    result = 
    cond do
      a == 0 or b == 0 -> 0
      a == b -> ejer3(a - 1, b - 1) + 2 * a - 1
      a > b  -> ejer3(a - b, b) + ejer3(b, b)
      a < b  -> ejer3(a, a) + ejer3(b - a, a)
    end
  end

  #Ejercicio #4
  def ejer4(a,b) do
    result = 
    cond do
      b == 0 -> a
      b > a -> ejer4(b, a)
      true -> ejer4(a - b, b)
    end
  end
end
