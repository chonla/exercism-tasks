module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Empty | BST a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (BST _ l _) = Just l

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (BST _ _ r) = Just r

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue (BST v _ _) = Just v

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList [] = empty
fromList xs = foldr insert empty (reverse xs)

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (BST v l r)
    | x <= v = BST v (insert x l) r
    | otherwise = BST v l (insert x r)

singleton :: a -> BST a
singleton x = (BST x Empty Empty)

toList :: BST a -> [a]
toList Empty = []
toList (BST v l r) = (toList l) ++ [v] ++ (toList r)