defmodule BeerSong do
  def beer_on_the_wall_verse(number) do
    cond do
      number == 1 -> "1 bottle of beer on the wall, 1 bottle of beer.\n"
      number == 0 -> "No more bottles of beer on the wall, no more bottles of beer.\n"
      true -> "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
    end
  end

  def beer_left_on_the_wall_verse(number) do
    cond do
      number == 0 -> "Take it down and pass it around, no more bottles of beer on the wall.\n"
      number == 1 -> "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      number < 0 -> "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      true -> "Take one down and pass it around, #{number} bottles of beer on the wall.\n"
    end
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    beer_on_the_wall_verse(number) <> beer_left_on_the_wall_verse(number - 1)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.map(fn b -> verse(b) end)
    |> Enum.join("\n")
  end
end
