module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot Bearing (Integer, Integer)

bearing :: Robot -> Bearing
bearing (Robot b _) = b

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ (x, y)) = (x, y)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot b (x, y) = Robot b (x, y)

move :: Robot -> String -> Robot
move (Robot b (x, y)) [] = Robot b (x, y)
move (Robot b (x, y)) (i:is)
    | b == North && i == 'A' = move (Robot b (x, y + 1)) is
    | b == North && i == 'R' = move (Robot East (x, y)) is
    | b == North && i == 'L' = move (Robot West (x, y)) is
    | b == East && i == 'A' = move (Robot b (x + 1, y)) is
    | b == East && i == 'R' = move (Robot South (x, y)) is
    | b == East && i == 'L' = move (Robot North (x, y)) is
    | b == South && i == 'A' = move (Robot b (x, y - 1)) is
    | b == South && i == 'R' = move (Robot West (x, y)) is
    | b == South && i == 'L' = move (Robot East (x, y)) is
    | b == West && i == 'A' = move (Robot b (x - 1, y)) is
    | b == West && i == 'R' = move (Robot North (x, y)) is
    | b == West && i == 'L' = move (Robot South (x, y)) is
move _ _ = error "Should not be here"