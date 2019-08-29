module CollatzConjecture (collatz) where

evalCollatz :: Integer -> Integer
evalCollatz num
    | even num = num `div` 2
    | otherwise = (num * 3) + 1

collatz :: Integer -> Maybe Integer
collatz num
    | num <= 0 = Nothing
    | otherwise = Just (fromIntegral (length (takeWhile (>1) (iterate (evalCollatz) num))))
