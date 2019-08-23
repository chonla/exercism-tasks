module RunLength (decode, encode) where

import Data.List as L
import Data.Char as C

dec :: Int -> String -> [String]
dec _ "" = []
dec carry (x:xs)
    | C.isDigit(x) = dec ((carry * 10) + C.digitToInt(x)) xs
    | not (C.isDigit(x)) && carry == 0 = [[x]] ++ (dec 0 xs)
    | otherwise = [take carry (repeat x)] ++ (dec 0 xs)

enc :: String -> String
enc s 
    | slen > 1 = (show slen) ++ [head s]
    | otherwise = s
        where
            slen = length s

decode :: String -> String
decode "" = ""
decode s = intercalate "" (dec 0 s)

encode :: String -> String
encode "" = ""
encode s = intercalate "" (map enc (group s))

