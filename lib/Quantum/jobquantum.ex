defmodule JobQuantum do
  def print(number, msg) do
    IO.inspect(msg <> "#{number}")
    number
  end

  def print_text(path, msg) do
    fun = &(&1 + 1)
    write = &(&2 |> File.write("#{&1}"))

    if File.exists?(path) do
      path |> File.read! |> String.to_integer |> fun.() |> print(msg) |> write.(path)
    else
      path |> File.open!([:write]) |> File.close
      path |> File.write("0")
    end
  end
end
