#!./parrot -C
#
# pidigits N  (N = 1000 for shootout)
#
# this requires libgmp (GMP) on the machine
#
# by Leopold Toetsch
# not really optimized yet
# modified by Karl Forner to set a default value of N=27 (shootout test default) 

#def gen_x():
#    return imap(lambda k: (k, 4*k + 2, 0, 2*k + 1), count(1))

.pragma n_operators 1

.sub count
    .param pmc start
loop:
    .yield(start)
    inc start
    goto loop
.end
		
.sub gen_x
    .param pmc start
    .local pmc k
loop:
    k = count(start)
    $P0 = k + 0
    $P1 = k * 4
    inc $P1
    inc $P1
    $P2 = new .Integer
    $P3 = k * 2
    inc $P3
    .yield ($P0, $P1, $P2, $P3)
    goto loop
.end

#def compose((aq, ar, as_, at), (bq, br, bs, bt)):
#    return (aq * bq,
#            aq * br + ar * bt,
#            as_ * bq + at * bs,
#            as_ * br + at * bt)

.sub "compose"
    .param pmc aq
    .param pmc ar
    .param pmc as
    .param pmc at
    .param pmc bq
    .param pmc br
    .param pmc bs
    .param pmc bt
    $P0 = aq * bq
    $P1 = aq * br
    $P12 = ar * bt
    $P1 = $P1 + $P12
    $P2 = as * bq
    $P22 = at * bs
    $P2 = $P2 + $P22
    $P3 = as * br
    $P32 = at * bt
    $P3 =  $P3 + $P32
    .return ($P0, $P1, $P2, $P3)
.end

#def extract((q, r, s, t), j):
#    return (q*j + r) // (s*j + t)

.sub extract
    .param pmc q
    .param pmc r
    .param pmc s
    .param pmc t
    .param pmc j
    $P0 = q * j
    $P0 = $P0 + r
    $P1 = s * j
    $P1 = $P1 + t
    $P0 = $P0 // $P1
    .return ($P0)
.end

#def pi_digits():
#
#    z = (1, 0, 0, 1)
#    x = gen_x()

.sub pi_digits
    .local pmc x0,x1,x2,x3, y, z0,z1,z2,z3, one, three, four
    z0 = new .Integer
    z0 = 1
    z1 = new .Integer
    z2 = new .Integer
    z3 = new .Integer
    z3 = 1
    one = new .Integer
    one = 1
    three = new .Integer
    three = 3
    four = new .Integer
    four = 4
#    while 1:
#        y = extract(z, 3)
loop1:
	y = extract(z0, z1, z2, z3, three)
	
#        while y != extract(z, 4):
loop2:
	    $P0 = extract(z0, z1, z2, z3, four)
	    if y == $P0 goto end_loop2
	
#            z = compose(z, x.next())
	    ($P1, $P2, $P3, $P4) = gen_x(one)
	    (z0, z1, z2, z3) = "compose"(z0, z1, z2, z3, $P1, $P2, $P3, $P4)
	
#            y = extract(z, 3)
	    y = extract(z0, z1, z2, z3, three)
	goto loop2
end_loop2:
#        z = compose((10, -10*y, 0, 1), z)
#        yield y
	$P5 = new .Integer
	$P5 = 10
	$P6 = new .Integer
	$P6 = -10
	$P6 = $P6 * y
	$P7 = new .Integer
	$P8 = new .Integer
	$P8 = 1
	(z0, z1, z2, z3) = "compose"($P5, $P6, $P7, $P8, z0, z1, z2, z3)
	.yield (y)
    goto loop1
.end

#def main():
#    n = int(sys.argv[1])
#    digits = pi_digits()
#    width = 10
#    for i in xrange(width, n+1, width):
#        print "%s\t:%d" % ("".join(imap(str, islice(digits, width))), i)
#    if n % width > 0:
#        print "%s\t:%d" % ("".join(imap(str, islice(digits, n % width))).ljust(width), n)
#
#main()

.sub main :main
	.param pmc argv
	.local int argc, i, N, width

	N = 27
	argc = argv
	if argc == 1 goto default
	$S0 = argv[1]
	N = $S0
default:
     width = 10
    null i
loop:
    $P0 = pi_digits()
    print $P0
    inc i
    $I0 = i % width
    if $I0 goto n
    print "\t:"
    print i
    print "\n" 
n:
    if i < N goto loop
    $I0 = i % width
    unless $I0 goto done
    $I0 = width - $I0
rest:
        print " "
        dec $I0
        if $I0 goto rest
    print "\t:"
    print N
    print "\n" 
done:
.end
    
