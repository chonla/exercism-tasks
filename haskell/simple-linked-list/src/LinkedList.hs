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

data LinkedList a = Nothing | Int deriving (Eq, Show)

datum :: LinkedList a -> a
datum linkedList = error "You need to implement this function."

fromList :: [a] -> LinkedList a
fromList xs = error "You need to implement this function."

isNil :: LinkedList a -> Bool
isNil Nothing = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x linkedList = error "You need to implement this function."

next :: LinkedList a -> LinkedList a
next linkedList = error "You need to implement this function."

nil :: LinkedList a
nil = Nothing

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList linkedList = error "You need to implement this function."

toList :: LinkedList a -> [a]
toList linkedList = error "You need to implement this function."
