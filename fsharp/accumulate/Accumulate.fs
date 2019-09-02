module Accumulate

let rec accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    match input with
    | [] -> List.empty
    | _ -> func(input.[0]) :: (accumulate (func) (List.tail(input)))