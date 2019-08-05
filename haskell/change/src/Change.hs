module Change (findFewestCoins) where

-- import Data.Maybe

delast :: [Integer] -> [Integer]
delast [] = []
delast list = (reverse . tail) (reverse list)

appendSolution :: Integer -> Maybe [Integer] -> Maybe [Integer]
appendSolution _ Nothing = Nothing
appendSolution c (Just l) = Just (c : l)

coinsUsed :: Integer -> [Integer] -> Maybe [Integer]
coinsUsed _ [] = Nothing
coinsUsed 0 _ = Just []
coinsUsed target [c]
    | target < 0 = Nothing
    | target >= c = appendSolution c (coinsUsed (target - c) [c])
    | otherwise = Nothing
coinsUsed target coins
    | target < 0 = Nothing
    | target >= biggest = appendSolution biggest (coinsUsed (target - biggest) coins)
    | otherwise = coinsUsed target (delast coins)
        where
            biggest = last coins

fewerSolution :: Maybe [Integer] -> Maybe [Integer] -> Maybe [Integer]
fewerSolution Nothing Nothing = Nothing
fewerSolution Nothing s = s
fewerSolution s Nothing = s
fewerSolution (Just s1) (Just s2)
    | length s1 > length s2 = Just s2
    | otherwise = Just s1

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins _ [] = Nothing
findFewestCoins target coins = fewerSolution (coinsUsed target coins) (findFewestCoins target (delast coins))
