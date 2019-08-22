module Pangram

let alphabet = Set.ofSeq['a'..'z']

let isPangram (input: string): bool = 
    alphabet = Set.filter (fun (c) -> alphabet.Contains(c)) (Set.ofArray(input.ToLower().ToCharArray()))