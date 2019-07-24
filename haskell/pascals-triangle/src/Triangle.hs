module Triangle (rows) where

factorial :: Int -> Int
factorial x
    | x > 0 = x * (factorial (x - 1))
    | x == 1 = 1

row :: Int -> [Integer]
row x
    | x == 1 = [1]
    | x > 1 = elementInRow x 1

elementInRow :: Int -> Int -> Int
elementInRow r i = (factorial r) / ((factorial i) * (factorial r - i))

rows :: Int -> [[Integer]]
rows x
    | x == 0 = []
    | x > 0 = (row x) : rows (x - 1)
