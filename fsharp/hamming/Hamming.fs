module Hamming

let tally (x: int option): int option =
    match x with
    | Some v -> Some (v + 1)
    | None -> None

let rec distance (strand1: string) (strand2: string): int option = 
    match [strand1; strand2] with
    | [strand1; strand2] when strand1 = "" && strand2 = "" -> Some 0
    | [strand1; strand2] when strand1 = "" && strand2 <> "" -> None
    | [strand1; strand2] when strand1 <> "" && strand2 = "" -> None
    | [strand1; strand2] when strand1.[0] = strand2.[0] -> distance strand1.[1..] strand2.[1..]
    | [strand1; strand2] when strand1.[0] <> strand2.[0] -> tally (distance strand1.[1..] strand2.[1..])
    | _ -> Some 0
