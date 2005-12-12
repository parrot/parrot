import sys

def ack(m, n):
    if (not m):
	return n + 1
    if (not n):
	return ack(m - 1, 1)
    return ack(m - 1, ack(m, n - 1))

def main():
    n = int(sys.argv[1])
    sys.setrecursionlimit(10000)
    print "Ack(3, %d) = %d" % (n, ack(3, n))

main()
