#! python

import sys

def fib(n):
    if (n < 2):
        return(n)
    return( fib(n-2) + fib(n-1) )

N = int(len(sys.argv) == 2 and sys.argv[1] or 24)

print "fib(%d) = %d" %( N, fib(N) )
