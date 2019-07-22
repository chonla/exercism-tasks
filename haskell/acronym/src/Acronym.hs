module Acronym (abbreviate) where

import Data.Char as Char
abbreviate :: String -> String
abbreviate xs = map toUpper (map head (words (addSpace xs)))

addSpace :: String -> String
addSpace "" = ""
addSpace (x:xs)
    | xs == [] = [x]
    | (isLower x) && (isUpper (head xs)) = x : ' ' : (addSpace xs)
    | x == '-' && xs /= [] = ' ' : (addSpace xs)
    | otherwise = x : (addSpace xs)