module Matrix (saddlePoints) where

import Data.Array (Array, (!), assocs, indices)
import Data.List as L

isMaxInRow :: Array (Int, Int) Int -> (Int, Int) -> Bool
isMaxInRow matrix (r, c) = (length bigger) == 0
    where
        bigger = L.filter (\((x, y), v) -> x == r && y /= c && v > value) (assocs matrix)
        value = matrix ! (r, c)

isMinInColumn :: Array (Int, Int) Int -> (Int, Int) -> Bool
isMinInColumn matrix (r, c) = (length smaller) == 0
    where
        smaller = L.filter (\((x, y), v) -> x /= r && y == c && v < value) (assocs matrix)
        value = matrix ! (r, c)

findSaddle :: Array (Int, Int) Int -> [(Int, Int)] -> [(Int, Int)]
findSaddle _ [] = []
findSaddle matrix (c:cs)
    | (isMaxInRow matrix c) && (isMinInColumn matrix c) = c : (findSaddle matrix cs)
    | otherwise = findSaddle matrix cs

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix = findSaddle matrix (indices matrix)
