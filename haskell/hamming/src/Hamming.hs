module Hamming (distance) where

import Data.Maybe

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance xs [] = Nothing
distance [] ys = Nothing
distance (x:xs) (y:ys)
    | length xs /= length ys = Nothing
    | x == y = Just (0 + fromJust (distance xs ys))
    | otherwise = Just (1 + fromJust (distance xs ys))