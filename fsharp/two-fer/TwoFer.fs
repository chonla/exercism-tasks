module TwoFer

let nameOf (input: string option): string =
    match input with
    | Some v -> v
    | _ -> "you"

let twoFer (input: string option): string = 
    "One for " + (nameOf input) + ", one for me."