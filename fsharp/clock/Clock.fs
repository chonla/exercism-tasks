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

let subtract minutes clock = 
    add (-minutes) clock

let timeOf (Clock clock) = (clock / 60, clock % 60)

let display clock = 
    let time = timeOf clock
    sprintf "%02d:%02d" (fst time) (snd time)
