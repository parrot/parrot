# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/addit.pasm - Variable Argument Subroutines

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/addit.pasm

=head1 DESCRIPTION

Joe Wilson's original PASM version of his C<varargs> subroutines
benchmark. It calls an "add it" function 500000 times in a loop and
prints the result (21001097.970000).

=cut

_main:
        new P5, .PerlArray
        push P5, 1000
        push P5, 7.100
        push P5, 87
        push P5, "3.87"
        push P5, "21000000"
        set I9, 500000
AGAIN:
        dec I9
        lt I9, 0, FIN
        bsr _varargs_adder
        branch AGAIN
FIN:
        print N5
        print "\n"
        end

_varargs_adder:
        new P2, .PerlNum
        set I1, P5
LOOP:
        dec I1
        lt I1, 0, DONE
        set P1, P5[I1]
        add P2, P1
        branch LOOP
DONE:
        set N5, P2
        ret

=head1 SEE ALSO

F<examples/benchmarks/addit.pl>, F<examples/benchmarks/addit.imc>,
F<examples/benchmarks/addit2.imc>.

=cut
