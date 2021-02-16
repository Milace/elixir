defmodule Concat do
    def join(a, b \\ nil, sep \\ " ")

    def join(a, b, _sep) when is_nil(b), do: a

    def join(a, b, sep) do
        a <> sep <> b
    end

    #Ejercicio reduccion
    def reduction(n)  do
        reductionp(String.codepoints(n))
    end

    defp reductionp([], list),  do: Enum.join(list)

    defp reductionp([head | tail], list \\ [])  do
        result =
            cond do
                head in list -> list
                head not in list -> list ++ [head]
            end

        reductionp(tail, result)
    end
end