defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna([head|tail]) do
    [dna_rna_map(head) | to_rna(tail)]
  end

  def to_rna([]) do
    []
  end

  def dna_rna_map(c) do
    dnaMap = %{?G=>?C, ?C=>?G, ?T=>?A, ?A=>?U}
    dnaMap[c]
  end
end
