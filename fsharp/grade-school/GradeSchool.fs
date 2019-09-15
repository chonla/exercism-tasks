module GradeSchool

type School = Map<int, string list>

let empty : School = Map.empty

let add (student : string) (grade : int) (school : School) : School =
    let newRoster studentList = Map.add grade studentList school
    school
    |> Map.tryFind grade
    |> function
        | Some students -> newRoster (List.sort (student :: students))
        | None -> newRoster [student]

let roster (school : School) : string list =
    school
    |> Map.toList
    |> List.collect snd

let grade (number : int) (school : School) : string list =
    school
    |> Map.tryFind number 
    |> Option.defaultValue []
