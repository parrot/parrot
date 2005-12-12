import sys
from itertools import *

def gen_x():
    return imap(lambda k: (k, 4*k + 2, 0, 2*k + 1), count(1))

def compose((aq, ar, as_, at), (bq, br, bs, bt)):
    return (aq * bq,
            aq * br + ar * bt,
            as_ * bq + at * bs,
            as_ * br + at * bt)

def extract((q, r, s, t), j):
    return (q*j + r) // (s*j + t)

def pi_digits():
    z = (1, 0, 0, 1)
    x = gen_x()
    while 1:
        y = extract(z, 3)
        while y != extract(z, 4):
            z = compose(z, x.next())
            y = extract(z, 3)
        z = compose((10, -10*y, 0, 1), z)
        yield y

def main():
    n = int(sys.argv[1])
    digits = pi_digits()
    width = 10
    for i in xrange(width, n+1, width):
        print "%s\t:%d" % ("".join(imap(str, islice(digits, width))), i)
    if n % width > 0:
        print "%s\t:%d" % ("".join(imap(str, islice(digits, n % width))).ljust(width), n)

main()

