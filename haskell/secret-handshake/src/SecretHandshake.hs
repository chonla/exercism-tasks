module SecretHandshake (handshake) where

import Data.List as L
import Data.Bits as B

messageBit :: Int -> Int -> [String]
messageBit n i
    | bitOn 1 = ["wink"]
    | bitOn 2 = ["double blink"]
    | bitOn 3 = ["close your eyes"]
    | bitOn 4 = ["jump"]
    | otherwise = []
    where
        bitOn j = (B.testBit n (j - 1)) && (i == j)

encodeHandshake :: Int -> [String] -> [String]
encodeHandshake n s
    | B.testBit n 4 = L.reverse s
    | otherwise = s

handshake :: Int -> [String]
handshake n = encodeHandshake n ((messageBit n 1) ++ (messageBit n 2) ++ (messageBit n 3) ++ (messageBit n 4))
