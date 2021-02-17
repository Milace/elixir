defmodule Request do
    use HTTPoison.Base

    @url_location "https://rickandmortyapi.com/api/location/"
    @url_episode "https://rickandmortyapi.com/api/episode/"
    @url_character "https://rickandmortyapi.com/api/character/"

    def do_get(url) do
        case HTTPoison.get(url) do
            {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
              IO.puts body
            {:ok, %HTTPoison.Response{status_code: 404}} ->
              IO.puts "Not found :("
            {:error, %HTTPoison.Error{reason: reason}} ->
              IO.inspect reason
        end
    end

    

    def character(n) when is_number(n) do
        IO.puts "character ----> "
        do_get(@url_character <> "#{n}")        
    end

    def character(n), do: IO.puts "Ingrese un valor correcto"


    def episode(n) when is_number(n) do
        IO.puts "episode ----> "
        do_get(@url_episode <> "#{n}")
    end

    def episode(n), do: IO.puts "Ingrese un valor correcto"


    def location(n) when is_number(n) do
        IO.puts "Location ----> " 
        do_get(@url_location <> "#{n}")
    end

    def location(n), do: IO.puts "Ingrese un valor correcto"
end