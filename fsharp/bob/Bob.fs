module Bob

let removeNonwordChars (input: string): string =
    input
    |> String.filter (fun c -> System.Char.IsLetter c || c = '?')

let (|Shouting|_|) (input: string): Option<unit> = 
    let cleanInput = removeNonwordChars input
    if cleanInput.Length > 0 && cleanInput.ToUpper () = cleanInput then Some () else None

let (|Questioning|_|) (input: string): Option<unit> =
    let cleanInput = removeNonwordChars input
    if cleanInput.EndsWith "?" then Some () else None

let (|Saying|_|) (input: string): Option<unit> =
    let cleanInput = removeNonwordChars input
    if cleanInput.Length > 1 then Some () else None

let (|Nothing|_|) (input: string): Option<unit> =
    if input.Trim () = "" then Some () else None

let response (input: string): string = 
    match input with
    | Nothing -> "Fine. Be that way!"
    | Saying & Shouting & Questioning -> "Calm down, I know what I'm doing!"
    | Questioning -> "Sure."
    | Shouting -> "Whoa, chill out!"
    | _ -> "Whatever."
