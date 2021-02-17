IO.puts("===String===")
IO.puts(String.length("hellö"))
IO.puts(String.upcase("hellö"))

IO.puts("===Anonymous functions===")

add = fn a, b -> a + b end
IO.puts(add.(1, 2))
IO.puts("is_function(add, 2) #{is_function(add, 2)}")
IO.puts("is_function(add, 1) #{is_function(add, 1)}")

double = fn a -> add.(a, a) end
IO.puts(double.(2))
IO.puts("is_function(double, 1) #{is_function(double, 1)}")

x = 42
IO.puts(x)
IO.puts((fn -> x = 0 end).())
IO.puts(x)

IO.puts("===functions caption===")

add = fn a, b -> a + b end
add_caption = &(&1 + &2)
IO.puts(add_caption.(1, 2))
IO.puts(is_function(add_caption))
IO.puts(is_function(add, 2))
IO.puts(is_function(add, 1))

IO.inspect(Enum.map([{1, 2}, {3, 4}], fn {a, b} -> a + b end), label: "Lista")
# IO.inspect(Enum.map([{1, 2}, {3, 4}], &(&1 + &2)), label: "Lista")

nombre= %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]}

[ john: ^nombre, mary: _ ] = users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]

IO.puts(nombre.age)

# users = put_in users[:john].age, 31
users = put_in(users[:john].age, 31)
IO.inspect(users)

users2 = update_in(users[:mary].languages,
                      fn languages->
                        List.delete(languages, "Clojure")
                      end
)
IO.inspect(users2)
