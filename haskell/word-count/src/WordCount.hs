module WordCount (wordCount) where

import Data.Text as T
import Data.List as L

distinct :: [Text] -> [Text]
distinct [] = []
distinct (w:ws)
    | w `elem` ws = distinct ws
    | otherwise = w : distinct ws

countTuple :: Text -> [Text] -> (String, Int)
countTuple needle haystack = (unpack needle, L.length (L.filter (== needle) haystack))

unquote :: Text -> Text
unquote x = T.dropAround (=='\'') x

tokenize :: Text -> [Text]
tokenize xs = L.map unquote (L.filter (/= T.empty) (T.split (`notElem` '\'':(['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'])) xs))

wordCount :: String -> [(String, Int)]
wordCount xs = L.map (\w -> countTuple w tokenizedWords) (distinct tokenizedWords)
    where
        sentence = T.toLower (pack xs)
        tokenizedWords = tokenize sentence