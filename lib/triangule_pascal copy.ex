defmodule TriangulePascal do

  # def main(k) do

  #   print_row = fn(row) ->
  #     line = 0..row
  #     |> Enum.map(&binomial_coefficients(row, &1))
  #     |> Enum.join(" ")
  #     IO.puts line
  #   end

  #   0..k-1 |> Enum.map(&print_row.(&1))
  # end

  def main(k) do

    print_row = fn(row) ->
      line = 0..row
      |> IO.inspect(label: "1111")
      |> Enum.map(fn x -> binomial_coefficients(row, x) |> IO.inspect(label: "2222") end)
      |> IO.inspect(label: "3333")
      |> Enum.join(" ") #[1,2,3] -> 1-2-3
      |> IO.inspect(label: "444")
      IO.puts line
    end

    0..k-1 |> IO.inspect(label: "555") |> Enum.map(fn x -> print_row.(x) end) |> IO.inspect(label: "555")
  end

  def binomial_coefficients(n, r) do
    factorial(n) / (factorial(r) * factorial(n - r)) |> round

    # round(factorial(n) / (factorial(r) * factorial(n - r)))
  end

  def factorial(0), do: 1
  def factorial(n) when n > 0, do: n * factorial(n - 1) |> IO.inspect(label: "6666")



end
