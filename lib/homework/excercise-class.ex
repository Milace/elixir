defmodule ExcerciseClass do
  nombre = %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]}

  [john: ^nombre, mary: _] =
    users = [
      john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
      mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
    ]

  IO.puts(nombre.age)

  # user = put_in users[:john].age, 31
  users = put_in(users[:john].age, 31)
  IO.inspect(users)

  users2 =
    update_in(
      users[:mary].languages,
      fn languages ->
        List.delete(languages, "Clojure")
      end
    )

  IO.inspect(users2)
end
