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
    dnaMap = %{71=>67, 67=>71, 84=>65, 65=>85}
    dnaMap[c]
  end
end
