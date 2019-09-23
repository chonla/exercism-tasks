module Clock

type clock = Clock of int

[<Literal>]
let MinutesInADay = 1440

let modulo dividend divisor =
    if dividend = 0 then 0
    elif dividend > 0 then dividend % divisor
    else divisor + (dividend % divisor)

let create hours minutes = 
    Clock (modulo ((hours * 60) + minutes) MinutesInADay)

let add minutes (Clock clock) = 
    Clock (modulo (clock + minutes) MinutesInADay)

let subtract minutes (Clock clock) = 
    Clock (modulo (clock - minutes) MinutesInADay)

let hoursOf (Clock clock) = clock / 60

let minutesOf (Clock clock) = clock % 60

let display clock = sprintf "%02d:%02d" (hoursOf clock) (minutesOf clock)
