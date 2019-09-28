module Bob

let shouting (input: string): bool = 
    (input.Length > 0) && (input.ToUpper() = input)

let questioning (input: string): bool =
    input.EndsWith("?")

let forcefulQuestioning (input: string): bool =
    shouting(input) && questioning(input) && (input.Length > 1)

let cleanup (input: string): string =
    input
    |> String.filter (fun c -> (System.Char.IsLetter c) || (c = '?'))

let response (input: string): string = 
    let cleanInput = cleanup(input)
    if input.Trim() = "" then
        "Fine. Be that way!"
    else
        match cleanInput with
        | cleanInput when forcefulQuestioning(cleanInput) -> "Calm down, I know what I'm doing!"
        | cleanInput when questioning(cleanInput) -> "Sure."
        | cleanInput when shouting(cleanInput) -> "Whoa, chill out!"
        | _ -> "Whatever."
