module Raindrops

let drop = Map.empty.Add(3, "Pling").Add(5, "Plang").Add(7, "Plong")

let convert (number: int): string =
    let r = Array.map (fun num -> drop.[num]) ( Array.filter (fun num -> number % num = 0) [| 3; 5; 7 |] )
    match Array.isEmpty(r) with
    | true -> number.ToString()
    | _ -> String.concat "" r