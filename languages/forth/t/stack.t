#!../../parrot test.pir

# non-empty stack
1 2    3 4  5
1 2 3 4 5

DROP
1 2 3 4

OVER
1 2 3 4 3

SWAP
1 2 3 3 4

DUP
1 2 3 3 4 4

3 0SP

1 2 3 ROT
2 3 1
