module Raindrops

let drop: Map<int,string> = Map.ofSeq([(3, "Pling");(5, "Plang");(7, "Plong")])

let convert (number: int): string =
    let dropkeys = Array.map (fun (k, v) -> k) (Map.toArray (drop))
    let r = Array.map (fun num -> drop.[num]) (Array.filter (fun num -> number % num = 0) dropkeys)
    if Array.isEmpty(r) then
        number.ToString()
    else
        String.concat "" r