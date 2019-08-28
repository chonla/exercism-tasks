module CollatzConjecture (collatz) where

evalCollatz :: Integer -> Integer
evalCollatz num
    | even num = num `div` 2
    | otherwise = (num * 3) + 1

buildCollatzSequence :: Integer -> [Integer]
buildCollatzSequence num
    | c == 1 = [c]
    | otherwise = c : (buildCollatzSequence c)
        where
            c = evalCollatz num

collatz :: Integer -> Maybe Integer
collatz num
    | num <= 0 = Nothing
    | num == 1 = Just 0
    | otherwise = Just (fromIntegral (length (buildCollatzSequence num)))
