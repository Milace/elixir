defprotocol CursoElixir.Protocols.Size do
  @doc """
  Calculate the size of data structure
  """
  @fallback_to_any true
  def size(data)
  def size_2(data)
end
