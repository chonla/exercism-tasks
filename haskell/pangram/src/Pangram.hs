module Pangram (isPangram) where

import Data.List as L
import Data.Char as C
import Data.Set as S

alphabet :: [Char]
alphabet = ['a'..'z']
alphabetSet :: Set Char
alphabetSet = S.fromList alphabet

extractAlphabets :: String -> String
extractAlphabets text = L.filter (`elem` alphabet) text

lowerString :: String -> String
lowerString text = L.map C.toLower text

isPangram :: String -> Bool
isPangram text = (S.fromList (L.map head (L.group (L.sort (extractAlphabets (lowerString text)))))) == alphabetSet
