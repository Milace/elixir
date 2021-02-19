defimpl CursoElixir.Protocols.Size, for: Any do
  def size(_), do: {:error, "DataStruct is not defined"}
  def size_2(_), do: {:error, "DataStruct is not defined"}
end

defimpl CursoElixir.Protocols.Size, for: BitString do
  def size(string), do: byte_size(string)
  def size_2(string), do: byte_size(string)
end

defimpl CursoElixir.Protocols.Size, for: Map do
  def size(string), do: map_size(string)
  def size_2(string), do: map_size(string)
end

defimpl CursoElixir.Protocols.Size, for: Tuple do
  def size(string), do: tuple_size(string)
  def size_2(string), do: tuple_size(string)
end

defimpl CursoElixir.Protocols.Size, for: CursoElixir.Structs.User do
  def size(string), do: map_size(string)-1
  def size_2(string), do: map_size(string)+1
end
