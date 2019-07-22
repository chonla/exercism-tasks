module Luhn (isValid) where

import Data.Char as Char
import Data.List as List

isValid :: String -> Bool
isValid n
    | List.length cleanN == 1 = False
    | otherwise = (rem (checkSum (normalize cleanN)) 10) == 0
        where
            cleanN = removeSpaces n

removeSpaces :: String -> String
removeSpaces xs = [x | x <- xs, x /= ' ']

normalize :: String -> String
normalize xs 
    | (List.length xs) `mod` 2 == 1 = "0" ++ xs
    | otherwise = xs

wrap :: Int -> Int
wrap n
    | n <= 9 = n
    | otherwise = n - 9

checkSum :: String -> Int
checkSum n
    | List.length n == 0 = 0
    | otherwise = (wrap ((toNumber x1) * 2)) + (toNumber x2) + (checkSum xs)
        where
            x1 = head n
            x2 = head (tail n)
            xs = tail (tail n)

toNumber :: Char -> Int
toNumber c = (Char.ord c) - zero
    where zero = Char.ord '0'