module Leap

let isDivisibleBy (year: int) (num: int): bool = year % num = 0

let leapYear (year: int): bool = 
    year |> isDivisibleBy <| 4 && (
        not (year |> isDivisibleBy <| 100) || year |> isDivisibleBy <| 400
    )
