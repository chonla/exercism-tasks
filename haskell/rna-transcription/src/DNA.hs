module DNA (toRNA) where

dna :: Char -> Maybe Char
dna 'C' = Just 'G'
dna 'G' = Just 'C'
dna 'T' = Just 'A'
dna 'A' = Just 'U'
dna _ = Nothing

toRNA :: String -> Either Char String
toRNA [] = Right []
toRNA (x:xs) =
    case dna x of
        Just c -> fmap ([c] ++) (toRNA xs)
        Nothing -> Left x
