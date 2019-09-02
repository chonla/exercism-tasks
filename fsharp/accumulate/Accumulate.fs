module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    let rec mapAccum f acc = function
        | [] -> acc
        | head::tail -> mapAccum f (f head :: acc) tail
    mapAccum func [] input |> List.rev
