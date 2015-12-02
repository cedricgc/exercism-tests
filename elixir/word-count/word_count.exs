defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    tokens = String.split(String.replace(String.downcase(sentence), ~r/[[:punct:]]/, " ")) 
    word_dict = build_map(tokens, Map.new())
  end

  defp build_map([head | tail], map) do
    map = build_map(tail, map)
    Map.update(map, head, 1, fn(val) -> val + 1 end)
  end

  defp build_map([], map) do
    map
  end
end
