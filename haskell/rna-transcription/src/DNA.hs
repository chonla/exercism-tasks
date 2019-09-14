module DNA (toRNA) where

import Data.Maybe

dna :: Char -> Maybe Char
dna 'C' = Just 'G'
dna 'G' = Just 'C'
dna 'T' = Just 'A'
dna 'A' = Just 'U'
dna _ = Nothing

toRNA :: String -> Either Char String
toRNA x 
    | firstFail /= [] = Left (fst (head firstFail))
    | otherwise = Right (map (fromJust . snd) transcription)
    where
        transcription = zip x (fmap (dna) x)
        firstFail = filter (\p -> snd p == Nothing) transcription
