# The Computer Language Shootout
# http://shootout.alioth.debian.org/
#
# Contributed by Sokolov Yura

from sys import argv
def fannkuch(n):
    count = range(1,n+1)
    maxFlipsCount, m, r, check = 0, n-1, n, 0

    perm1 = range(n)
    perm  = range(n)
    perm1_ins = perm1.insert
    perm1_pop = perm1.pop
    while True:
	if check < 30:
	    print "".join(`i+1` for i in perm1)
	    check += 1;

	while r != 1:
	    count[r-1] = r
	    r -= 1

	if perm1[0] != 0 and perm1[m] != m:
	    perm[:]=perm1
	    flipsCount = 0
	    k = perm[0]
	    while k:
		perm[:k+1] = perm[k::-1]
		flipsCount += 1
		k = perm[0]

	    if flipsCount > maxFlipsCount:
		maxFlipsCount = flipsCount
		maxPerm = list(perm1)

	while True:
	    if r == n: return maxFlipsCount
	    perm1_ins(r,perm1_pop(0))
	    count[r] -= 1
	    if count[r] > 0: break
	    r += 1

def main():
    n = int(argv and argv[1] or 1)
    print "Pfannkuchen(%d) = %d\n"%(n,fannkuch(n)),

if __name__=="__main__":
    main()

