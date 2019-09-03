module Accumulate

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    let rec mapAccum acc = function
        | [] -> acc
        | head::tail -> mapAccum (func head :: acc) tail
    mapAccum [] input |> List.rev
