defmodule StringCompression do
  @spec compression(String.t()) :: String.t()
  def compression(string) do
    string
    |> String.codepoints()
    |> IO.inspect(label: "1 ->>>")
    |> Enum.chunk_by(fn x -> x end)
    |> IO.inspect(label: "2 ->>>")
    |> Enum.map(fn x ->
      "#{List.first(x)}" <> "#{if Enum.count(x) == 1, do: "", else: Enum.count(x)}"
    end)
    |> IO.inspect(label: "3 ->>>")
    |> List.to_string()
    |> IO.inspect(label: "4 ->>>")

    List.to_string(
      Enum.map(
        Enum.chunk_by(
          String.codepoints(string),
           fn x -> x end),
            fn x -> "#{List.first(x)}" <> "#{if Enum.count(x) == 1, do: "", else: Enum.count(x)}"
      end)
    )
  end
end
