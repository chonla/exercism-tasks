module Raindrops

let drop = [|(3, "Pling");(5, "Plang");(7, "Plong")|]

let convert (number: int): string =
    let r = 
        drop 
        |> Array.filter (fun (k, v) -> number % k = 0)
        |> Array.map (fun (k, v) -> v)
    if Array.isEmpty(r) then
        number.ToString()
    else
        String.concat "" r