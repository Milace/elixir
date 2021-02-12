defmodule Excercise do
  # Tringulo de pascal Ejemplo 1####################
  def pascal1(1),
    do:
      (
        IO.puts("1")
        [1]
      )

  def pascal1(current_level) do
    list = pascal1(current_level - 1)

    new_list =
      [1] ++ for(x <- 0..(length(list) - 1), do: Enum.at(list, x) + Enum.at(list, x + 1, 0))

    Enum.join(new_list, " ") |> IO.puts()
    new_list
  end

  # Tringulo de pascal Ejemplo 2###################
  # def pascal2(n), do: pascal2(n,[1])
  def pascal2(1, list), do: list

  def pascal2(n, list \\ [1]) do
    # def pascal2(n,list) do
    IO.inspect(list)
    new_list = Enum.zip([0] ++ list, list ++ [0]) |> Enum.map(fn {a, b} -> a + b end)
    pascal2(n - 1, new_list)
  end

  # Fibonacci######################################
  def fibonacci(n) do
    if n < 2 do
      n
    else
      fibonacci(n - 2) + fibonacci(n - 1)
    end
  end

  # Ejercicio #1
  # Guardia
  def ejer1(0, sum), do: sum

  def ejer1(n, sum \\ 0) do
    sum = sum + n
    ejer1(n - 1, sum)
  end

  def ejer11(n) do
    Enum.sum(0..n)
  end

  # Ejercicio #2
  def ejer2(n) do
    if n > 0 do
      Enum.map(1..n, & &1)
    end
  end

  def ejer21(n) do
    fibo =
      cond do
        n > 2 -> fibonacci(n - 1) + fibonacci(n - 2)
        n == 1 or n == 2 -> 1
      end
  end

  # Ejercicio #3
  def ejer3(a, b) do
    result =
      cond do
        a == 0 or b == 0 -> 0
        a == b -> ejer3(a - 1, b - 1) + 2 * a - 1
        a > b -> ejer3(a - b, b) + ejer3(b, b)
        a < b -> ejer3(a, a) + ejer3(b - a, a)
      end
  end

  # Ejercicio #4
  def ejer4(a, b) do
    result =
      cond do
        b == 0 -> a
        b > a -> ejer4(b, a)
        true -> ejer4(a - b, b)
      end
  end

  # fibonacci optimizado
  def fib_optimized(n) when is_integer(n) and n > 0, do: fibo_p(n, 0, 1)
  defp fibo_p(1, _, b), do: b
  defp fibo_p(n, a, b), do: fibo_p(n - 1, b, a + b)

  # for loop
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} - #{i} ")
        for_loop(i + 1, n, value)

      true ->
        "Acabo"
    end
  end

  # for loop 2
  def for_loop_dos(i, n, value) when i < n do
    IO.puts("#{value} - #{i} ")
    for_loop_dos(i + 1, n, value)
  end

  def for_loop_dos(_, _, _), do: :ok

  #  Escribe una funcion que reciba un numero entero n e imprima lo siguiente
  def tringule(1, value), do: value

  def tringule(n, list \\ [1]) when n > 1 do
    IO.inspect(list)
    [head | _tail] = list

    if head > 0 do
      tringule(n - 1, [0 | list])
    else
      tringule(n - 1, [1 | list])
    end
  end

  # Diseñe una funcion recursiva de una lista de numeros
  def sum([], sum), do: sum

  def sum([head | tail], sum \\ 0) do
    sum(tail, sum + head)
  end

  # Diseñe una funcion recursiva que retorne el reverse de la misma
  def reverse([], list), do: list

  def reverse([head | tail], list \\ []) do
    reverse(tail, [head] ++ list)
  end

  # Diseñe una funcion recursiva que verifique que todos los numeros de la lista son ascendentes
  def ascendant?([], comparation, boolean), do: boolean

  def ascendant?([head | tail], comparation \\ 0, boolean \\ true) when boolean == true do
    ascendant?(tail, head, head > comparation)
  end
end
