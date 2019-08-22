module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
    | length xs /= length ys = Nothing
    | otherwise = Just (length (filter (\(c1,c2) -> c1 /= c2) (zip xs ys)))