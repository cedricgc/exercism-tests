defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base = String.downcase(base)
    Enum.filter(candidates, fn(word) -> 
      base != String.downcase(word) and anagram?(base, String.downcase(word))
    end)
  end

  # Base case
  defp anagram?(same_string, same_string), do: true
  defp anagram?(a, b) do
    if String.length(a) != String.length(b) do
      false
    else
      letter = String.first(a)
      sub_a = String.replace(a, letter, "", global: false)
      sub_b = String.replace(b, letter, "", global: false)
      anagram?(sub_a, sub_b)
    end
  end
end
