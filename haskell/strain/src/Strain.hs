module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard p xs = [x | x <- xs, (not . p) x]

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep p xs = [x | x <- xs, p x]
