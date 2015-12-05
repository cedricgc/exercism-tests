defmodule Sublist do
  @moduledoc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list, list) :: :equal | :unequal | :sublist | :superlist
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) do
    # Cond will return on first match
    cond do
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  # Compare already checks if lists are equal so there will be no
  # case of sublist?([], [])
  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, b) when length(a) > length(b), do: false
  defp sublist?(a, b=[_ | tail]) do
    if list_in_list?(a, b), do: true, else: sublist?(a, tail)
  end

  # Exhausted first list, it is sublist
  defp list_in_list?([], _), do: true
  # Pattern matching :)
  defp list_in_list?([same_val | tail_a], [same_val | tail_b]) do
    list_in_list?(tail_a, tail_b)
  end
  # If it doesnt match the preceding patterns it is not sublist
  defp list_in_list?(_, _), do: false
end
