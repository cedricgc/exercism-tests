defmodule DNA do
  @moduledoc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """

  @complements %{?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C}

  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: Enum.map(dna, &(@complements[&1]))
end
