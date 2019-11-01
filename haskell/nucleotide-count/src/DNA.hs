module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as Map

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

invalidNucleotides :: String -> String
invalidNucleotides xs = filter (`notElem` "ACGT") xs

anyInvalidNucleotide :: String -> Bool
anyInvalidNucleotide xs = (length (invalidNucleotides xs)) > 0

countNucleotides :: String -> Map Nucleotide Int
countNucleotides xs = Map.fromList [(A, (countInDNA xs 'A')), (C, (countInDNA xs 'C')), (G, (countInDNA xs 'G')), (T, (countInDNA xs 'T'))]

countInDNA :: String -> Char -> Int
countInDNA xs c = length (filter (==c) xs)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | anyInvalidNucleotide xs = Left (invalidNucleotides xs)
    | otherwise = Right (countNucleotides xs)
