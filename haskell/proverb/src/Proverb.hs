module Proverb(recite) where

proverb :: (String, String) -> String
proverb (p, q) = "For want of a " ++ p ++ " the " ++ q ++ " was lost."

recite :: [String] -> String
recite [] = ""
recite [a] = "And all for the want of a " ++ a ++ "."
recite list = unlines (map (proverb) (zip list $ tail list)) ++ "And all for the want of a " ++ (head list) ++ "."
