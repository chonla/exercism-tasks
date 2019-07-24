module Phone (number) where

clean :: String -> String
clean num = filter (`elem` ['0'..'9']) num

number :: String -> Maybe String
number xs
    | hasCountryCode = Just (tail cleanNum)
    | withoutCountryCode = Just cleanNum
    | otherwise = Nothing
    where
        hasCountryCode = ((length cleanNum) == 11) && (validCountryCode cleanNum) && ((validAreaCode . tail) cleanNum) && ((validExchangeCode . tail) cleanNum)
        withoutCountryCode = ((length cleanNum) == 10) && validAreaCode cleanNum && validExchangeCode cleanNum
        validCountryCode numWithCountryCode = (head numWithCountryCode) == '1'
        validAreaCode numWithoutCountryCode = (head numWithoutCountryCode) `elem` ['2'..'9']
        validExchangeCode numWithoutCountryCode = numWithoutCountryCode!!3 `elem` ['2'..'9']
        cleanNum = clean xs
