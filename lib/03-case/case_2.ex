# x = 5

# y =
#   case 10 do
#     ^x -> "the value match with #{x}"
#     10 -> "the value does not match with #{x}"
#     56 -> "the value does not match with #{x}"
#   end

# IO.puts(y)

# texto = "soy un texto"

# result =
#   case {:ok, "soy un texto"} do
#     {:ok, ^texto} -> "Does not match"
#     {:ok, "soy un texto"} -> "match"
#   end


#  {a, b}= result2 =
#   case {:ok, "ssoy un textsso"} do
#     {:ok, "soy un sstexto"} ->
#       {:ok, "salio exitoso"}
#     {:ok, ^texto} -> {:error, "error"}

#   end

# IO.inspect(a, label: "a->")
# IO.inspect(b, label: "b->")
# IO.inspect(result2, label: "->>>")
