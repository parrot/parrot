# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/mandel.pasm - Print the Mandlebrot set

=head1 SYNOPSIS

    % ./parrot examples/assembly/mandel.pasm

=head1 DESCRIPTION

This really does something - prints an ASCII-art representation of the
Mandlebrot set.

Translated from C code by Glenn Rhoads into Parrot assembler by Leon
Brocard <acme@astray.com>.

The C code is:

    main() {
        int x, y, k;
        char *b = " .:,;!/>)|&IH%*#";
        float r, i, z, Z, t, c, C;
        for (y=30; puts(""), C = y*0.1 - 1.5, y--;) {
            for (x=0; c = x*0.04 - 2, z=0, Z=0, x++ < 75;) {
                for (r=c, i=C, k=0; t = z*z - Z*Z + r, Z = 2*z*Z + i, z=t, k<112; k++)
                    if (z*z + Z*Z > 10) break;
                printf ("%c", b[k%16]);
            }
        }
    }

We store the following variables in these registers:

     x,  y, k
    I1, I2, I3

     r,  i,  z,  Z,  t,  c, C
    N1, N2, N3, N4, N5, N6, N7

=cut

	set S1, " .:,;!/>)|&IH%*#"
	set I2, 30

YREDO:  #  C = y*0.1 - 1.5
	set N8, I2
	set N9, 0.1
        mul N7, N8, N9
	set N8, 1.5
	sub N7, N7, N8

	set I1, 0

XREDO:  # c = x*0.04 - 2
        set N8, I1
	set N9, 0.04
	mul N6, N8, N9
	set N8, 2.0
	sub N6, N6, N8
	set N3, 0
	set N4, 0

        set N1, N6
        set N2, N7

        set I3, 0

KREDO:  # t = z*z - Z*Z + r
        mul N8, N3, N3
        mul N9, N4, N4
        sub N5, N8, N9
        add N5, N5, N1

        # Z = 2*z*Z + i
        add N4, N4, N4
        mul N4, N4, N3
        add N4, N4, N2

        # z = t
        set N3, N5

        # if (z*z + Z*Z > 10) break;
        mul N8, N3, N3
        mul N9, N4, N4
        add N8, N8, N9
        gt N8, 10.0, PRINT

	inc I3
	lt I3, 112, KREDO

PRINT:  mod I4, I3, 16
        substr S2, S1, I4, 1
	print S2

	inc I1
	lt I1, 75, XREDO

	print "\n"
	dec I2
	gt I2, 0, YREDO

END:    end
