module CustomSet
  ( delete
  , difference
  , empty
  , fromList
  , insert
  , intersection
  , isDisjointFrom
  , isSubsetOf
  , member
  , null
  , size
  , toList
  , union
  ) where

import Prelude hiding (null)

data CustomSet a = Empty | CustomSet [a] deriving (Eq, Show)

delete :: (Eq a, Ord a) => a -> CustomSet a -> CustomSet a
delete _ Empty = Empty
delete _ (CustomSet []) = Empty
delete x (CustomSet (y:ys))
  | x /= y = union (fromList [y]) (delete x (fromList ys))
  | otherwise = fromList ys

difference :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
difference Empty _ = Empty
difference (CustomSet []) _s = Empty
difference setA Empty = setA
difference (CustomSet (x:xs)) setB
  | member x setB = difference (fromList xs) setB
  | otherwise = union (fromList [x]) (difference (fromList xs) setB)

empty :: CustomSet a
empty = Empty

fromList :: (Ord a) => [a] -> CustomSet a
fromList [] = Empty
fromList xs = (CustomSet (qsort xs))

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = (qsort (filter (<x) xs)) ++ [x] ++ (qsort (filter (>x) xs))

insert :: (Ord a) => a -> CustomSet a -> CustomSet a
insert x Empty = fromList [x]
insert x setB@(CustomSet a)
  | member x setB = setB
  | otherwise = fromList (x:a)

intersection :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
intersection Empty _ = Empty
intersection (CustomSet []) _ = Empty
intersection _ Empty = Empty
intersection (CustomSet (x:xs)) setB
  | member x setB = union (fromList [x]) (intersection (fromList xs) setB)
  | otherwise = intersection (fromList xs) setB

isDisjointFrom :: (Eq a, Ord a) => CustomSet a -> CustomSet a -> Bool
isDisjointFrom Empty _ = True
isDisjointFrom (CustomSet []) _ = True
isDisjointFrom _ Empty = True
isDisjointFrom (CustomSet (x:xs)) setB
  | member x setB = False
  | otherwise = isDisjointFrom (fromList xs) setB

isSubsetOf :: (Eq a, Ord a) => CustomSet a -> CustomSet a -> Bool
isSubsetOf Empty _ = True
isSubsetOf (CustomSet []) _ = True
isSubsetOf _ Empty = False
isSubsetOf (CustomSet (x:xs)) setB
  | member x setB = isSubsetOf (fromList xs) (delete x setB)
  | otherwise = False

member :: (Eq a, Ord a) => a -> CustomSet a -> Bool
member _ Empty = False
member _ (CustomSet []) = False
member x (CustomSet (y:ys))
  | x == y = True
  | otherwise = member x (fromList ys)

null :: CustomSet a -> Bool
null Empty = True
null _ = False

size :: CustomSet a -> Int
size Empty = 0
size (CustomSet xs) = length xs

toList :: CustomSet a -> [a]
toList Empty = []
toList (CustomSet xs) = xs

union :: (Ord a) => CustomSet a -> CustomSet a -> CustomSet a
union Empty setB = setB
union setA Empty = setA
union (CustomSet xs) (CustomSet ys) = fromList (xs ++ ys)
