module Raindrops

let drop: Map<int,string> = Map.ofSeq([(3, "Pling");(5, "Plang");(7, "Plong")])

let convert (number: int): string =
    let r = 
        drop 
        |> Map.toArray
        |> Array.map (fun (k, v) -> k)
        |> Array.filter (fun num -> number % num = 0)
        |> Array.map (fun num -> drop.[num])
    if Array.isEmpty(r) then
        number.ToString()
    else
        String.concat "" r