module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Empty | LinkedList a (LinkedList a) deriving (Eq, Show)

datum :: LinkedList a -> a
datum Empty = error "It should not happen."
datum (LinkedList v _) = v

fromList :: [a] -> LinkedList a
fromList [] = nil
fromList (x:xs) = LinkedList x (fromList xs)

isNil :: LinkedList a -> Bool
isNil Empty = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x linkedList = (LinkedList x linkedList)

next :: LinkedList a -> LinkedList a
next Empty = Empty
next (LinkedList _ n) = n

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList linkedList = fromList (reverse (toList linkedList))

toList :: LinkedList a -> [a]
toList Empty = []
toList (LinkedList v Empty) = [v]
toList (LinkedList v n) = [v] ++ (toList n)
