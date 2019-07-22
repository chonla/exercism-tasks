module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n == 0 = Nothing
    | otherwise = Just (toInteger lastPrime)
        where
            lastPrime = last (take n [x | x <- [2..], isPrime x])

isPrime :: Int -> Bool
isPrime n = 1 == length (filter (==0) (map (n `mod`) [1..n-1]))
