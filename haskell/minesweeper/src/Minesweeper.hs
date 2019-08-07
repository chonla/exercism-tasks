module Minesweeper (annotate) where

import Data.Array (Array, bounds, (!), listArray, assocs)
import Data.Char (ord, chr)

isTopLeftExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isTopLeftExplosive _ (0, _) = False
isTopLeftExplosive _ (_, 0) = False
isTopLeftExplosive matrix (r, c) = matrix!(r-1, c-1) == '*'

isTopExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isTopExplosive _ (0, _) = False
isTopExplosive matrix (r, c) = matrix!(r-1, c) == '*'

isTopRightExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isTopRightExplosive _ (0, _) = False
isTopRightExplosive matrix (r, c)
    | c == colBound = False
    | otherwise = matrix!(r-1, c+1) == '*'
        where
            (_, (_, colBound)) = bounds matrix

isLeftExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isLeftExplosive _ (_, 0) = False
isLeftExplosive matrix (r, c) = matrix!(r, c-1) == '*'

isRightExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isRightExplosive matrix (r, c)
    | c == colBound = False
    | otherwise = matrix!(r, c+1) == '*'
        where
            (_, (_, colBound)) = bounds matrix

isBottomLeftExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isBottomLeftExplosive _ (_, 0) = False
isBottomLeftExplosive matrix (r, c)
    | r == rowBound = False
    | otherwise = matrix!(r+1, c-1) == '*'
        where
            (_, (rowBound, _)) = bounds matrix

isBottomExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isBottomExplosive matrix (r, c)
    | r == rowBound = False
    | otherwise = matrix!(r+1, c) == '*'
        where
            (_, (rowBound, _)) = bounds matrix

isBottomRightExplosive :: Array (Int, Int) Char -> (Int, Int) -> Bool
isBottomRightExplosive matrix (r, c)
    | r == rowBound = False
    | c == colBound = False
    | otherwise = matrix!(r+1, c+1) == '*'
        where
            (_, (rowBound, colBound)) = bounds matrix
            
ifTrueThen1 :: Bool -> Int
ifTrueThen1 True = 1
ifTrueThen1 False = 0

toAnnotation :: Int -> Char
toAnnotation 0 = ' '
toAnnotation n = chr (ord '0' + n)

annotateCells :: Array (Int, Int) Char -> ((Int, Int), Char) -> Char
annotateCells matrix ((r, c), e)
    | e == '*' = '*'
    | otherwise = toAnnotation (foldl (+) 0 (map ifTrueThen1 [
        isTopLeftExplosive matrix (r, c),
        isTopExplosive matrix (r, c),
        isTopRightExplosive matrix (r, c),
        isLeftExplosive matrix (r, c),
        isRightExplosive matrix (r, c),
        isBottomLeftExplosive matrix (r, c),
        isBottomExplosive matrix (r, c),
        isBottomRightExplosive matrix (r, c)
    ]))

toMatrix :: [String] -> Array (Int, Int) Char
toMatrix xss = matrix
    where
        rows      = length xss
        columns   = length $ head xss
        matrix    = listArray ((0, 0), (rows - 1, columns - 1)) (concat xss)

chunks :: Int -> String -> [String]
chunks _ [] = []
chunks n xs = (take n xs) : (chunks n (drop n xs))
        
annotate :: [String] -> [String]
annotate [] = []
annotate [""] = [""]
annotate board = chunks columns (map (\e -> annotateCells matrix e) (assocs matrix))
        where
            columns   = length $ head board
            matrix = toMatrix board
