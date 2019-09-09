module GradeSchool

type School = Map<int, string list>

let empty : School = Map.empty

let add (student : string) (grade : int) (school : School) : School =
    if school.ContainsKey(grade) then
        let students = school.[grade]
        school.Add(grade, List.sort (student :: students))
    else school.Add(grade, [ student ])

let roster (school : School) : string list =
    school
    |> Map.toList
    |> List.map (fun (k, v) -> v)
    |> List.fold List.append []

let grade (number : int) (school : School) : string list =
    let students = school.TryFind number
    match students with
    | Some v -> v
    | None -> []
