module SpaceAge

type Planet =
    | Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

[<Literal>]
let SecondsInEarthDay = 31557600.0

let earthYear =
    dict [ Earth, 1.0
           Mercury, 0.2408467
           Venus, 0.61519726
           Mars, 1.8808158
           Jupiter, 11.862615
           Saturn, 29.447498
           Uranus, 84.016846
           Neptune, 164.79132 ]

let age (planet : Planet) (seconds : int64) : float =
    (float(seconds)/ earthYear.Item(planet))/SecondsInEarthDay
