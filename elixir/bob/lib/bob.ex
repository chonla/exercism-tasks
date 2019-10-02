defmodule Bob do
  defp saying_something(input), do: String.upcase(input) != String.downcase(input)
  defp shouting(input), do: String.upcase(input) == input
  defp questioning(input), do: String.ends_with?(input, "?")
  defp silence(input), do: String.trim(input) == ""

  @spec hey(binary) :: <<_::72>>
  def hey(input) do
    cond do
      silence(input) -> "Fine. Be that way!"
      saying_something(input) && questioning(input) && shouting(input) -> "Calm down, I know what I'm doing!"
      questioning(input) -> "Sure."
      saying_something(input) && shouting(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
