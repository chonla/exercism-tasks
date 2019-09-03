﻿module SpaceAge

type Planet =
    | Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

let earthYear =
    [| (Earth, 1.0)
       (Mercury, 0.2408467)
       (Venus, 0.61519726)
       (Mars, 1.8808158)
       (Jupiter, 11.862615)
       (Saturn, 29.447498)
       (Uranus, 84.016846)
       (Neptune, 164.79132) |]

let age (planet : Planet) (seconds : int64) : float =
    earthYear
    |> Array.filter (fun (k, v) -> k = planet)
    |> Array.map (fun (k, v) -> (float (seconds) / v) / float (31557600))
    |> Array.head