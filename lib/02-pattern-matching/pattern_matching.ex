IO.puts("Hola mundo")
[a | b] = mylist = [1, 2, 3]
# IO.puts mylist
IO.inspect(mylist, label: "->")
IO.inspect(a, label: "->")
IO.inspect(b, label: "->")

[%{firtname: a} | b] =
  personas = [
    %{firtname: "Milthon", lastname: "Ceballos"},
    %{firtname: "Nicole", lastname: "Ceballos"}
  ]

IO.inspect(a, label: "-->")
