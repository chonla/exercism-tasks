module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aboutHalfOf :: Int -> Int
aboutHalfOf num = num `div` 2

aliquot :: Int -> [Int]
aliquot num = filter isFactorOfNum [1 .. (aboutHalfOf num)]
    where isFactorOfNum n = num `mod` n == 0

classify :: Int -> Maybe Classification
classify num 
    | num <= 0 = Nothing
    | sumAliquot == num = Just Perfect
    | sumAliquot > num = Just Abundant
    | sumAliquot < num = Just Deficient
    | otherwise = Nothing
        where
            sumAliquot = (sum . aliquot) num