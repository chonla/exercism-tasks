module CryptoSquare (encode) where

import Data.Char as Char
import Data.List as List

encode :: String -> String
encode xs = List.intercalate " " (transpose (chunksOf (normalize xs)))

normalize :: String -> String
normalize xs = [Char.toLower(x) | x <- xs, Char.isAlphaNum x]

chunks :: Int -> String -> [String]
chunks cs xs
    | xs == [] = []
    | xsLength < cs = [xs ++ (take (cs - xsLength) (repeat ' '))]
    | otherwise = take cs xs : chunks cs (drop cs xs)
    where
        xsLength = List.length xs

chunksOf :: String -> [String]
chunksOf xs = chunks cs xs
    where cs = chunkSize (List.length xs)

chunkSize :: Int -> Int
chunkSize s = ceiling (sqrt (fromIntegral s :: Float))
