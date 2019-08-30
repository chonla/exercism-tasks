module DNA (toRNA) where

import Data.Map as M

dna :: Map Char Char
dna = M.fromList [('C', 'G'), ('G', 'C'), ('T', 'A'), ('A', 'U')]

concatRNA :: Char -> Either Char String -> Either Char String
concatRNA _ (Left c) = Left c
concatRNA c (Right s) = Right ([c] ++ s)

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA (x:xs)
    | M.notMember x dna = Left x
    | otherwise = concatRNA (dna!x) (toRNA xs)
