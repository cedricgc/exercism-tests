defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(strand)
    validate(nucleotide)
    Enum.count(strand, &(nucleotide == &1))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    validate(strand)
    Enum.reduce(@nucleotides, %{}, fn(base, base_map) -> 
      Map.put_new(base_map, base, count(strand, base))
    end)
  end

  defp validate(arg) when is_list(arg) do
    unless Enum.all?(arg, &(Enum.member?(@nucleotides, &1))) do
      raise ArgumentError, message: "Invalid nucleotide in argument"
    end
  end
  defp validate(arg), do: validate(List.wrap(arg))
end
