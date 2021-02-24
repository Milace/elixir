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
  def pascal2(n, list \\ [1])

  def pascal2(1, list), do: list

  def pascal2(n, list) do
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
  def ejer1(n, sum \\ 0)

  def ejer1(0, sum), do: sum

  def ejer1(n, sum) do
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
    cond do
      n > 2 -> fibonacci(n - 1) + fibonacci(n - 2)
      n == 1 or n == 2 -> 1
    end
  end

  # Ejercicio #3
  def ejer3(a, b) do
    cond do
      a == 0 or b == 0 -> 0
      a == b -> ejer3(a - 1, b - 1) + 2 * a - 1
      a > b -> ejer3(a - b, b) + ejer3(b, b)
      a < b -> ejer3(a, a) + ejer3(b - a, a)
    end
  end

  # Ejercicio #4
  def ejer4(a, b) do
    cond do
      b == 0 -> a
      b > a -> ejer4(b, a)
      true -> ejer4(a - b, b)
    end
  end

  # fibonacci optimizado
  def fib_optimized(n) when is_integer(n) and n > 0, do: fibo_p(n, 0, 1) #Guardia
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
  def tringule(n, list \\ [1])

  def tringule(1, value), do: value

  def tringule(n, list) when n > 1 do
    IO.inspect(list)
    [head | _tail] = list

    if head > 0 do
      tringule(n - 1, [0 | list])
    else
      tringule(n - 1, [1 | list])
    end
  end

  # Diseñe una funcion recursiva de una lista de numeros
  def sum(list, sum \\ 0)

  def sum([], sum), do: sum

  def sum([head | tail], sum) do
    sum(tail, sum + head)
  end

  # Diseñe una funcion recursiva que retorne el reverse de la misma
  def reverse(list, list \\ [])

  def reverse([], list), do: list

  def reverse([head | tail], list) do
    reverse(tail, [head] ++ list)
  end

  # Diseñe una funcion recursiva que verifique que todos los numeros de la lista son ascendentes
  def ascendant?(list, comparation \\ 0, boolean \\ true)

  def ascendant?([], _comparation, boolean), do: boolean

  def ascendant?([head | tail], comparation, boolean) when boolean == true do
    ascendant?(tail, head, head > comparation)
  end

  # Input
  # unir("abcde", "pqrst")
  # rta: apbqcrdset

  # unir("hacker", "ranker")
  # rta: hraacnkkeerr

  # p = a b c d e
  # Q= p q r s t
  # R = ap bq cr ds et

  # Enum.join("")
  # Enum.join(lista, "")

  def unir(p, q), do: unirp(String.codepoints(p), String.codepoints(q))

  defp unirp(p, q, acum \\ [])

  defp unirp([], [], acum), do: Enum.join(acum)

  defp unirp([headp | tailp], [], acum), do: unirp(tailp, [], acum ++ [headp])

  defp unirp([], [headq | tailq], acum), do: unirp([], tailq, acum ++  [headq])

  defp unirp([headp | tailp], [headq | tailq], acum), do: unirp(tailp, tailq, acum ++ [headp <> headq])


  # Crear una funcion que lea aaabaaaaccaaaaba y devuelva a3ba4c2a4ba

  def cont(n) do
    contp(String.codepoints(n))
  end

  defp contp(l, list \\ [], count \\ 0, comp \\ "")

  defp contp([], list, count, comp) do
    Enum.join(list ++ [comp] ++ [count])
    # Enum.join(filter(list ++[comp]))

    # aux = list ++[comp] ++ ["#{count}"]
    # IO.inspect aux
    # Enum.filter(aux, fn x -> x != "0" and x != "" end) |> IO.inspect |> Enum.join("")
  end

  defp contp([head | tail], list, count, comp) do
    res_list =
      cond do
        comp == head -> list
        comp != head && count > 1 -> list ++ [comp] ++ ["#{count}"]
        true -> list ++ [comp]
      end

    res_count =
      cond do
        comp == head -> count + 1
        comp != head -> 1
      end

    contp(tail, res_list, res_count, head)
  end

  # defp filter(n), do: n

  # defp filter([head | tail]) do
  #   res =
  #     cond do
  #       head == "0" || head == "1" -> tail
  #       true -> [head] ++ tail
  #     end

  #   filter(res)
  # end


  def cont2(n) do
    # String.codepoints(n) |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    n
    |> String.codepoints
    |> Enum.chunk_by(&(&1))
    |> Enum.map(fn section ->
      length = length(section)
      #IO.inspect section
      if length > 1 do
        hd(section) <> "#{length}"
      else
        hd(section)
      end
    end)
    |> Enum.join()
  end

  # input abcdpqrs output badcqpsr
  # input afhk output fakh
  def change_data(string) do
    string
    |> String.codepoints
    |> Enum.chunk_every(2)
    |> Enum.flat_map(&(Enum.reverse(&1)))
    |> Enum.join()
  end

  # ejercicio(975) lógica 9+7+5
  #como aun tiene 2 digitos debe reduirlos
  # (2+1)
  def sum_numbers(n) do
    n = n |> Integer.to_string |> String.codepoints |> sum_numbersp

    #IO.puts n
    #res =
    cond do
      n > 9 -> sum_numbers(n)
      true -> n
    end

    #IO.puts res
  end

  defp sum_numbersp(_, acum \\ 0)
  defp sum_numbersp([], acum), do: acum
  defp sum_numbersp([head | tail], acum) do
    sum_numbersp(tail, acum + String.to_integer(head, 10))
  end

  # lista1 = [1,3,5]
  # lista2 = [1,2,3,4,5]
  # resultado = [2,4]

  # lista1 = [1,3,5,6,7,9]
  # lista2 = [1,2,3,4,5,6,7,8,9]
  # resultado = [2,4,8]


  #lista 1 = [203,204,205,206,207,208,203,205,206]
  #lista 2 = [203,204,204,205,206,207,205,208,203,205,206,204]
  #resultado = [204,205,204]

  #### Opcion 1 #####
  def search_numbers1(l1, l2) do
    cond do
      length(l1) >= length(l2) -> search_numbersp(l1, l2)
      true -> search_numbersp(l2, l1)
    end
  end

  defp search_numbersp(l1, l2, acum \\ [])

  defp search_numbersp([], [], acum), do: acum

  defp search_numbersp([_h | t], [], acum), do: acum ++ t

  defp search_numbersp([h1 | t1], [h2 | t2], acum) do
    cond do
      h1 == h2 -> search_numbersp(t1, t2, acum)
      h1 != h2 -> search_numbersp(tl(t1), t2, acum ++ [h1])
    end
  end

  #### Opcion 2 #####
  def search_numbers2(l1, l2) do
    cond do
      length(l1) >= length(l2) -> List.myers_difference(l1, l2) |> Keyword.get_values(:del) |> List.flatten
      true -> search_numbers2(l2, l1)
    end
  end

  # se va a enviar una cadena de string con a, b y c
  # a < b
  # b < c

  # input
  # aababc
  # output
  # aaabbc

  # input
  # ababacba
  # output
  # aaabbcab
  def sort_by_letters(string) do
    sort_by_lettersp(string |> String.codepoints, "c")
  end

  defp sort_by_lettersp(list, character, chunk \\ "", acc \\ [])

  defp sort_by_lettersp([], _, chunk, acc), do: chunk <> sort_joinp(acc)

  defp sort_by_lettersp([h | t], character, chunk, acc) do
    cond do
      h == character -> sort_by_lettersp(t, character, chunk <> sort_joinp(acc) <> character , [])
      true -> sort_by_lettersp(t, character, chunk , acc ++ [h])
    end
  end

  defp sort_joinp(list), do: list |> Enum.sort |> Enum.join

  #------------------------------------------------------------------------------------------------
  def sort_by_letters2_c(string) do
    cond do
      not is_binary(string) ->{:error, "Input is not valid. Should be a string"}
      true -> sort_by_letters2p(string, "c")
    end
  end

  def sort_by_letters2_a(string) do
    cond do
      not is_binary(string) ->{:error, "Input is not valid. Should be a string"}
      true -> sort_by_letters2p(string, "a")
    end
  end

  defp sort_by_letters2p(string, split_by) do
    string |> String.split(split_by) |> Enum.map(&(&1 |> String.codepoints |> Enum.sort |> Enum.join)) |> Enum.join(split_by)
  end

  #------------------------------------------------------------------------------------------------
  def sort_by_letters3(string) do
    string |> String.codepoints |> Enum.chunk_by(&(&1 == "c")) |> Enum.map_join(&(Enum.sort(&1)))
  end
end
