module Clock

type clock = Clock of int

[<Literal>]
let MinutesInADay = 1440

let offsetTime offset =
    if offset = 0 then 0
    elif offset > 0 then offset % MinutesInADay
    else MinutesInADay + (offset % MinutesInADay)

let create hours minutes = 
    Clock (offsetTime ((hours * 60) + minutes))

let add minutes (Clock clock) = 
    Clock (offsetTime (clock + minutes))

let subtract minutes (Clock clock) = 
    Clock (offsetTime (clock - minutes))

let hoursOf (Clock clock) = clock / 60

let minutesOf (Clock clock) = clock % 60

let display clock = sprintf "%02d:%02d" (hoursOf clock) (minutesOf clock)
