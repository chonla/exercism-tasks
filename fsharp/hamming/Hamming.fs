module Hamming

let rec distance (strand1: string) (strand2: string): int option = 
    match strand1.Length = strand2.Length with
    | false -> None
    | true -> Some (Seq.length (Seq.filter (fun (c1, c2) -> c1 <> c2) (Seq.zip strand1 strand2)))
