defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    tokens = sentence 
      |> String.downcase()
      |> String.replace(~r/@|#|\$|%|&|\^|:|_|!|,/u, " ") 
      |> String.split()
    Enum.reduce(tokens, Map.new(), &count_word/2)
  end

  defp count_word(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
