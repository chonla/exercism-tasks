defmodule Bob do
  defp is_saying_something(input), do: String.match?(input, ~r/[[:alpha:]]/)
  defp is_shouting(input), do: not String.match?(input, ~r/[[:lower:]]/)
  defp is_questioning(input), do: String.match?(input, ~r/\?$/)
  defp is_silence(input), do: String.match?(input, ~r/^\s*$/)

  @spec hey(binary) :: <<_::72>>
  def hey(input) do
    cond do
      is_silence(input) -> "Fine. Be that way!"
      is_saying_something(input) && is_questioning(input) && is_shouting(input) -> "Calm down, I know what I'm doing!"
      is_questioning(input) -> "Sure."
      is_saying_something(input) && is_shouting(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
