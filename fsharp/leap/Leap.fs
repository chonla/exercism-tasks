module Leap

let isDivisibleBy (year: int) (num: int): bool = year % num = 0

let leapYear (year: int): bool = 
    match year with
    | year when year |> isDivisibleBy <| 400 -> true
    | year when year |> isDivisibleBy <| 100 -> false
    | year when year |> isDivisibleBy <| 4 -> true
    | _ -> false