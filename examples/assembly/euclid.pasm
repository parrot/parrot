# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
# $Id$

=head1 NAME

examples/assembly/euclid.pasm - Euclid's algorithm

=head1 SYNOPSIS

    % ./parrot examples/assembly/euclid.pasm

=head1 DESCRIPTION

Implements Euclid's algorithm
(http://www.cut-the-knot.org/blue/Euclid.shtml) and uses it to compute
C<gcd(96,64)>.

Knuth, Donald E. I<The Art of Computer Programming Volume 1: Fundamental
Algorithms>. Third Edition. Section 1.1 Algorithm E (Euclid's algorithm)
Page 2:

    I1: m
    I2: n
    I4: r
    
    E1: Find remainder.
    E2: Is it zero?
    E3: Reduce.

=cut

main:   set    I1, 96
        set    I2, 64
        print  "Algorithm E (Euclid's algorithm)\n"
e1:     mod    I4, I1, I2
e2:     eq     I4, 0, done
e3:     set    I1, I2
        set    I2, I4
        branch e1
done:   print  I2
        print  "\n"
        end
