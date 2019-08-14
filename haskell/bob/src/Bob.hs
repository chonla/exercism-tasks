{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Text as T
import Data.Char as C

responseFor :: Text -> Text
responseFor = respond . T.stripEnd

respond :: Text -> Text
respond xs
    | isSayingNothing = "Fine. Be that way!"
    | isYelling && isQuestioning = "Calm down, I know what I'm doing!"
    | isYelling = "Whoa, chill out!"
    | isQuestioning = "Sure."
    | otherwise = "Whatever."
    where
        isSayingNothing = T.null xs
        isSayingSomething = T.any (`elem` ['a'..'z']) (T.toLower xs)
        isYelling = isSayingSomething && T.all (`elem` ['A'..'Z']) (T.filter (C.isAlpha) xs)
        isQuestioning = T.isSuffixOf "?" xs
