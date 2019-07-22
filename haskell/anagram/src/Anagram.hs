module Anagram (anagramsFor) where

import Data.List as List
import Data.Char as Char

insensitiveSort :: String -> String
insensitiveSort s = sort (toLowerString s)

toLowerString :: String -> String
toLowerString s = [toLower c | c <- s]

anagramsFor :: String -> [String] -> [String]
anagramsFor _ [] = []
anagramsFor xs xss = [x | x <- xss, insensitiveSort x == insensitiveSort xs && toLowerString x /= toLowerString xs]
