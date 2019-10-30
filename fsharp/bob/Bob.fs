module Bob

let (|Shouting|_|) (input: string): Option<unit> = 
    if input.Length > 0 && input.ToUpper () = input then Some Shouting else None

let (|Questioning|_|) (input: string): Option<unit> =
    if input.EndsWith "?" then Some Questioning else None

let (|Saying|_|) (input: string): Option<unit> =
    if input.Length > 1 then Some Saying else None

let removeNonwordChars (input: string): string =
    input
    |> String.filter (fun c -> System.Char.IsLetter c || c = '?')

let response (input: string): string = 
    if input.Trim () = "" then
        "Fine. Be that way!"
    else
        let cleanInput = removeNonwordChars input
        match cleanInput with
        | Saying & Shouting & Questioning -> "Calm down, I know what I'm doing!"
        | Questioning -> "Sure."
        | Shouting -> "Whoa, chill out!"
        | _ -> "Whatever."
