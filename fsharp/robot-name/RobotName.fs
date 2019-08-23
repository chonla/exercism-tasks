module RobotName

open System

type Bot = { Name: string }

let alphabet: char list = ['A'..'Z']
let number: char list = ['0'..'9']

let createName(): string = 
    String([|
        alphabet.[Random().Next() % 26];
        alphabet.[Random().Next() % 26];
        number.[Random().Next() % 10];
        number.[Random().Next() % 10];
        number.[Random().Next() % 10]
    |])

let mkRobot(): Bot = { Name = createName() }

let name (robot: Bot): string = robot.Name

let reset (robot: Bot) = mkRobot()