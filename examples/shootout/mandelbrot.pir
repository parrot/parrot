=head1 NAME

examples/shootout/mandelbrot.pir - Print the Mandelbrot set

=head1 SYNOPSIS

    % ./parrot examples/shootout/mandelbrot.pir -j 600 > out.pbm

=head1 DESCRIPTION

This outputs a pbm file of the Mandelbrot set. Defaults to 200x200.

Translated from C code by Greg Buchholz into PIR
by Peter Baylies <pbaylies@gmail.com>.

The C code is at:
   The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

=cut

.sub 'main' :main
	.param pmc argv
#    int w, h, x, y, bit_num = 0;
#    char byte_acc = 0;
#    int i, iter = 50;
#    double limit = 2.0;
#    double Zr, Zi, Cr, Ci, Tr, Ti;
	.local int    w, h, x, y, bit_num, byte_acc, i, iter
	.local num    limit, Zr, Zi, Cr, Ci, Tr, Ti
	.sym int argc
	bit_num = 0
	byte_acc = 0
	iter = 50
	limit = 2.0
#	slight optimization here -- nothing a decent C compiler wouldn't already do :)
	limit = limit * limit
	argc = argv
	w = 200
	if argc <= 1 goto noarg
#	w = atoi(argv[1]);
	$S0 = argv[1]
	w = $S0
#	h = w
noarg:	h = w
#	printf("P4\n%d %d\n",w,h);
	print "P4\n"
	print w
	print " "
	print h
	print "\n"
	y = 0
YREDO:
        x = 0
XREDO:
#       Zr = 0.0; Zi = 0.0;
	Zr = 0.0
	Zi = 0.0
#       Cr = (2*(double)x/w - 1.5);
	Cr = x
	Cr /= w
	Cr *= 2	
	Cr -= 1.5
#	Ci=(2*(double)y/h - 1);
	Ci = y
	Ci /= h
	Ci *= 2
	Ci -= 1

	i = 0
IREDO:
#	Tr = Zr*Zr - Zi*Zi + Cr;
        $N1 = Zr * Zr
        $N2 = Zi * Zi
        Tr = $N1 - $N2
        Tr += Cr
#       Ti = 2*Zr*Zi + Ci;
        Ti = 2
	Ti *= Zr
        Ti *= Zi
        Ti += Ci
#	Zr = Tr; Zi = Ti;
	Zr = Tr
	Zi = Ti
#	if (Zr*Zr+Zi*Zi > limit*limit) break;
#	$N1 = Zr * Zr
#	$N2 = Zi * Zi
        $N1 += $N2
        if $N1 > limit goto IBRK
	inc i
        if i < iter goto IREDO
IBRK:	
	byte_acc <<= 1
        if $N1 <= limit goto SLA
	byte_acc |= 0
	goto SLE
SLA:	byte_acc |= 1
SLE:	inc bit_num
	if bit_num != 8 goto NTST1
PRINT:	chr $S1, byte_acc
	print $S1
	byte_acc = 0
	bit_num = 0
	goto NTSTE
NTST1:	$I1 = w
	dec $I1
	goto NTSTE
	if x != $I1 goto NTSTE
	$I1 = w
	$I1 %= 8
	$I1 = 8 - $I1
	byte_acc <<= $I1
	goto PRINT
NTSTE:
	inc x
        if x < w goto XREDO

        inc y
        if y < h goto YREDO
	end
.end
