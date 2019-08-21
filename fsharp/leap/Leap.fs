module Leap

let isDivisibleBy (year: int, num: int): bool = year % num = 0

let leapYear (year: int): bool = 
    match year with
    | year when isDivisibleBy (year, 400) -> true
    | year when isDivisibleBy (year, 100) -> false
    | year when isDivisibleBy (year, 4) -> true
    | _ -> false