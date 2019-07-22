module Clock (addDelta, fromHourMin, toString) where

import Text.Printf as Printf

data Clock = Clock Int Int deriving (Show, Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock ((h + (m `div` 60)) `mod` 24) (m `mod` 60)

toString :: Clock -> String
toString (Clock h m) = Printf.printf "%02d:%02d" h m

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m (Clock ch cm) = fromHourMin (h + ch) (m + cm)
