defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @roman_numerals [
    %{1 => 'I', 5 => 'V', 10 => 'X'},
    %{1 => 'X', 5 => 'L', 10 => 'C'},
    %{1 => 'C', 5 => 'D', 10 => 'M'},
    %{1 => 'M'}
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeral_to_roman(number, @roman_numerals)
    |> to_string()
  end

  defp numeral_to_roman(number, roman_set) when number > 0 do
    numeral_to_roman(div(number, 10), tl(roman_set)) ++ romanize(rem(number, 10), hd(roman_set))
  end

  defp numeral_to_roman(_, _) do
    ''
  end

  defp romanize(number, roman_set) do
    case number do
      0 -> ''
      1 -> roman_set[1]
      2 -> roman_set[1] ++ roman_set[1]
      3 -> roman_set[1] ++ roman_set[1] ++ roman_set[1]
      4 -> roman_set[1] ++ roman_set[5]
      5 -> roman_set[5]
      6 -> roman_set[5] ++ roman_set[1]
      7 -> roman_set[5] ++ roman_set[1] ++ roman_set[1]
      8 -> roman_set[5] ++ roman_set[1] ++ roman_set[1] ++ roman_set[1]
      9 -> roman_set[1] ++ roman_set[10]
    end
  end
end
