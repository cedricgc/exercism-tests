defmodule DNA do
  @moduledoc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """

  @complements %{?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C}

  @spec to_rna([char]) :: [char]
  def to_rna([]), do: []
  def to_rna(dna=[head | tail]), do: [@complements[head] | to_rna(tail)]
end
