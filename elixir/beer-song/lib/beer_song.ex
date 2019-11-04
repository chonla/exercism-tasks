defmodule BeerSong do
  def beer_on_the_wall_verse(1) do
    "1 bottle of beer on the wall, 1 bottle of beer.\n"
  end

  def beer_on_the_wall_verse(0) do
    "No more bottles of beer on the wall, no more bottles of beer.\n"
  end

  def beer_on_the_wall_verse(number) do
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
  end

  def beer_left_on_the_wall_verse(0) do
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def beer_left_on_the_wall_verse(1) do
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def beer_left_on_the_wall_verse(number) when number < 0 do
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def beer_left_on_the_wall_verse(number) do
    "Take one down and pass it around, #{number} bottles of beer on the wall.\n"
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
