module Triangle (rows) where

factorial :: Int -> Int
factorial n
    | n <= 1 = 1
    | otherwise = n * factorial (n - 1)

elementAt :: Int -> Int -> Integer
elementAt r n = fromIntegral (factorial (r - 1) `div` (factorial n * factorial (r - 1 - n)))

row :: Int -> [Integer]
row x = map (\e -> elementAt x e) [0..(x-1)]

rows :: Int -> [[Integer]]
rows x
    | x == 0 = []
    | otherwise = rows (x - 1) ++ [row x]