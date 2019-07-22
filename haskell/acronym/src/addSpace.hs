import Data.Char as Char

addSpace :: String -> String
addSpace "" = ""
addSpace (x:xs)
    | xs == [] = [x]
    | (isLower x) && (isUpper (head xs)) = x : ' ' : (addSpace xs)
    | otherwise = x : (addSpace xs)