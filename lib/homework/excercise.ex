defmodule Excercise do
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
