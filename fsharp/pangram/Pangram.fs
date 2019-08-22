module Pangram

open System

let isPangram (input: string): bool = 
    input.ToLower().ToCharArray()
        |> Set.ofArray
        |> Set.filter Char.IsLetter
        |> Set.count
        |> (=) 26