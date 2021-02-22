defmodule ListComprenhension do
  def list1() do
    # for n <- [1,2,3,4] do
    #   n+n
    # end

    # for n <- 1..4, do: n + n

    values = [:good, 1, good: 2, bad: 3, good: 4]
    # values = [{:good, 1}, {good: 2}, {bad: 3}, {good: 4}]
    for {:good, numero} <- values, do: {:good, numero + 10}
  end

  def list2 do
    multiplos_3? = fn(n) -> rem(n, 3) == 0 end
    for n <- 0..5, multiplos_3?.(n), do: n * n
  end

  def list3() do
    # for i
    #  for j
    for i <- [:a, :b, :c, :d], j <- [1,2,3,4], do: {i, j}
  end

  # Transformaciones
  def list4() do
    ## Devuelve un mapa %{}
    # map = %{"a" => 1, "b" => 2}
    # for {key, value} <- map, into: %{}, do: {key, value * 10}

    ## Devuelve una lista []
    map = %{a: 1, b: 2}
    for {key, value} <- map, into: [], do: {key, value * 10}
  end

  def list5() do
    multiplos_3? = fn(n) -> rem(n, 3) == 0 end
    suma = fn(n) -> n + 10 end
    # multiplica = fn(n) -> n * n end

    for n <- 0..5, multiplos_3?.(n), do: IO.puts(suma.(n))
    # for n <- 0..5, multiplos_3?.(n), n > 1, do: n
  end

  def list6() do
    for c <- [72,101,108,108,111], into: "", do: <<c>> #Hello
  end

  def list7() do
    import Integer # para poder usar la funcion "is_even"
    for n <- 1..100, is_even(n), rem(n, 3) == 0, do: n
  end
end
Lis
