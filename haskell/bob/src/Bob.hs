module Bob (responseFor) where

import Data.Text as T

responseFor :: Text -> Text
responseFor xs
    | isSayingNothing = pack "Fine. Be that way!"
    | isYelling && isQuestioning = pack "Calm down, I know what I'm doing!"
    | isYelling = pack "Whoa, chill out!"
    | isQuestioning = pack "Sure."
    | otherwise = pack "Whatever."
    where
        trimmedRequest = T.strip xs
        isSayingNothing = trimmedRequest == (pack "")
        isSayingSomething = not $ T.null (T.filter (`elem` ['a'..'z']) (T.toLower trimmedRequest))
        isYelling = isSayingSomething && ((T.toUpper trimmedRequest) == trimmedRequest)
        isQuestioning = (T.last trimmedRequest)== '?'
