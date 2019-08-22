module Pangram

let alphabet = Set.ofSeq['a'..'z']

let isPangram (input: string): bool = 
    input.ToLower().ToCharArray()
        |> Set.ofArray
        |> Set.filter (fun (c) -> alphabet.Contains(c))
        |> (=) alphabet