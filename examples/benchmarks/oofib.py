#! python

import sys

class A:
    def fib(self,n):
        if (n < 2):
            return(n)
        return( self.fibA(n-2) + self.fibB(n-1) )
    def fibA(self,n):
        if (n < 2):
            return(n)
        return( self.fib(n-2) + self.fibB(n-1) )


class B (A):
    def fibB(self,n):
        if (n < 2):
            return(n)
        return( self.fib(n-2) + self.fibA(n-1) )


N = int(len(sys.argv) == 2 and sys.argv[1] or 28)

b = B()

print "fib(%d) = %d" %( N, b.fib(N) )
