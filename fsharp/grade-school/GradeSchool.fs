module GradeSchool

type School = Map<int, string list>

let empty : School = Map.empty

let add (student : string) (grade : int) (school : School) : School =
    let students = Map.tryFind grade school
    match students with
    | Some v -> Map.add grade (List.sort (student :: Option.get(students))) school
    | None -> Map.add grade [student] school

let roster (school : School) : string list =
    school
    |> Map.toList
    |> List.collect snd

let grade (number : int) (school : School) : string list =
    Map.tryFind number school
    |> Option.defaultValue []
