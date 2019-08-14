module CollatzConjecture (collatz) where

collatzStep :: Integer -> Integer -> Integer
collatzStep num stepCount
    | num == 1 = stepCount
    | isEven num = collatzStep (num `div` 2) nextStep
    | otherwise = collatzStep ((num * 3) + 1) nextStep
        where
            isEven n = n `mod` 2 == 0
            nextStep = stepCount + 1

collatz :: Integer -> Maybe Integer
collatz num
    | num <= 0 = Nothing
    | otherwise = Just (collatzStep num 0)