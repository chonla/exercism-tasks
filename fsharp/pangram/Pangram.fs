module Pangram

open System

let alphabet = Set.ofSeq['a'..'z']

let isPangram (input: string): bool = 
    input.ToLower().ToCharArray()
        |> Set.ofArray
        |> Set.filter Char.IsLetter
        |> (=) alphabet