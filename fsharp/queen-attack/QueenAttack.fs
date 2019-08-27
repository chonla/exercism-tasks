module QueenAttack

let create ((row, col): int * int) = (0 <= row) && (row <= 7) && (0 <= col) && (col <= 7)

let canAttack ((row1, col1): int * int) ((row2, col2): int * int) = 
    (col1 = col2) || (row1 = row2) || (abs((row1 - row2) / (col1 - col2)) = 1)