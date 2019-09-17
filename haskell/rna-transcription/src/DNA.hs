module DNA (toRNA) where

dna :: Char -> Either Char Char
dna 'C' = Right 'G'
dna 'G' = Right 'C'
dna 'T' = Right 'A'
dna 'A' = Right 'U'
dna c = Left c

toRNA :: [Char] -> Either Char [Char]
toRNA = traverse dna
