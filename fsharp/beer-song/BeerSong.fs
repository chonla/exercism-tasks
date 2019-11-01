module BeerSong

open System

let beerLeftVerse (numberOfBeer: int): string =
    if numberOfBeer = 1 then "Take one down and pass it around, 1 bottle of beer on the wall."
    elif numberOfBeer = 0 then "Take it down and pass it around, no more bottles of beer on the wall."
    elif numberOfBeer < 0 then "Go to the store and buy some more, 99 bottles of beer on the wall."
    else String.Format("Take one down and pass it around, {0} bottles of beer on the wall.", numberOfBeer)

let beerOnTheWallVerse (numberOfBeer: int): string =
    if numberOfBeer = 1 then "1 bottle of beer on the wall, 1 bottle of beer."
    elif numberOfBeer = 0 then "No more bottles of beer on the wall, no more bottles of beer."
    else String.Format("{0} bottles of beer on the wall, {0} bottles of beer.", numberOfBeer)

let verseOf (numberOfBeer: int): List<string> =
    [ ""
      beerOnTheWallVerse numberOfBeer
      beerLeftVerse (numberOfBeer - 1) ]

let recite (startBottles: int) (takeDown: int): List<string> =
    List.init takeDown (fun index -> startBottles - index)
    |> List.map verseOf
    |> List.fold List.append []
    |> List.tail
