module QueenAttack

let create ((r, c): int * int) = ((0 <= r) && (r <= 7)) && ((0 <= c) && (c <= 7))

let canAttack ((r1, c1): int * int) ((r2, c2): int * int) = 
    (c1 = c2) || (r1 = r2) || (abs((r1 - r2) / (c1 - c2)) = 1)