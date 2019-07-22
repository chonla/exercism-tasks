module Minesweeper (annotate) where

annotate :: [String] -> [String]
annotate board 
    | board == [] = []
    | board == [""] = [""]
    | otherwise = annotateCell 0 0 board

annotateCell :: Int -> Int -> String
annotateCell row col board
    | board!!row!!col == "*" = "*"
    | board!!row!!col == " " = countMine row col board

