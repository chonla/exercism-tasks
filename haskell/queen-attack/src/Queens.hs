module Queens (boardString, canAttack) where

put :: Char -> Int -> Int -> String -> String
put bw locY locX board = (take ((locY * 16) + (locX * 2)) board) ++ [bw] ++ (drop ((locY * 16) + (locX * 2 + 1)) board)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing = concat $ (replicate 8 "_ _ _ _ _ _ _ _\n")
boardString (Just (wx, wy)) Nothing = put 'W' wx wy (boardString Nothing Nothing)
boardString Nothing (Just (bx, by)) = put 'B' bx by (boardString Nothing Nothing)
boardString (Just (wx, wy)) (Just (bx, by)) = put 'W' wx wy (put 'B' bx by (boardString Nothing Nothing))

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (ax, ay) (bx, by)
    | sameRank = True
    | sameFile = True
    | isDiagonal = True
    | otherwise = False
        where
            sameRank = ax == bx
            sameFile = ay == by
            isDiagonal = abs (bx - ax) == abs (by - ay)
