module Accumulate

let rec accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    if List.isEmpty(input) then
        List.empty
    else
        func(input.[0]) :: (accumulate (func) (List.tail(input)))