module OCR (convert) where

import Data.List

chunks :: Int -> String -> [String]
chunks _ [] = []
chunks n xs = (take n xs) : (chunks n (drop n xs))

decode :: String -> Char
decode " || _ _  || " = '0'
decode "         || " = '1'
decode "  | ___  |  " = '2'
decode "    ___  || " = '3'
decode " |   _   || " = '4'
decode " |  ___   | " = '5'
decode " || ___   | " = '6'
decode "    _    || " = '7'
decode " || ___  || " = '8'
decode " |  ___  || " = '9'
decode _ = '?'

recognize :: [String] -> String
recognize [] = []
recognize (x:xs) = decode x : recognize xs

convert :: String -> String
convert xs
    | length (rotatedNumbers!!0) == 4 = recognize preparedNumbers
    | otherwise = convert (unlines (take 4 (lines xs))) ++ "," ++ convert (unlines (drop 4 (lines xs)))
    where
        preparedNumbers = chunks 12 (intercalate "" rotatedNumbers)
        rotatedNumbers = transpose (lines xs)

