module GradeSchool

type School = Map<int, string list>

let empty : School = Map.empty

let add (student : string) (grade : int) (school : School) : School =
    let newRoster studentList = school |> Map.add grade studentList

    school
    |> Map.tryFind grade
    |> Option.defaultValue []
    |> List.append [student]
    |> List.sort 
    |> newRoster

let roster (school : School) : string list =
    school
    |> Map.toList
    |> List.collect snd

let grade (number : int) (school : School) : string list =
    school
    |> Map.tryFind number 
    |> Option.defaultValue []
