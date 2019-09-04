defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @unword_chars [" ", ",", "!", "&", "@", "$", "%", "^", "_", ":"]

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase()
      |> words
      |> List.foldl(%{}, fn word, acc -> tally(word, acc) end)
  end

  defp words(line) do
    String.split(line, @unword_chars, trim: true)
  end

  defp tally(word, counter) do
    Map.update(counter, word, 1, &(&1 + 1))
  end
end
