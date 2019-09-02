defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @unword_chars [" ", ",", "!", "&", "@", "$", "%", "^", "_", ":"]

  @spec count(String.t()) :: map
  def count(sentence) do
    words = Enum.filter(String.split(String.downcase(sentence), @unword_chars), fn w -> w != "" end)
    List.foldl(words, %{}, fn word, acc -> tally(word, acc) end)
  end

  defp tally(word, counter) do
    Map.update(counter, word, 1, &(&1 + 1))
  end
end
