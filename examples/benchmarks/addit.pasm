# Copyright (C) 2001-2006, Parrot Foundation.

=head1 NAME

examples/benchmarks/addit.pasm - Variable Argument Subroutines

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/addit.pasm

=head1 DESCRIPTION

Joe Wilson's original PASM version of his C<varargs> subroutines
benchmark. It calls an "add it" function 50000 times in a loop and
prints the result (21001097.970000).

=cut

.pcc_sub :main _main:
        new P10, 'ResizableIntegerArray'
        new P5, 'ResizablePMCArray'
        push P5, 1000
        push P5, 7.100
        push P5, 87
        push P5, "3.87"
        push P5, "21000000"
        set I9, 50000
AGAIN:
        dec I9
        lt I9, 0, FIN
        local_branch P10, _varargs_adder
        branch AGAIN
FIN:
        print N5
        print "\n"
        end

_varargs_adder:
        new P2, 'Float'
        set I1, P5
LOOP:
        dec I1
        lt I1, 0, DONE
        set P1, P5[I1]
        add P2, P1
        branch LOOP
DONE:
        set N5, P2
        local_return P10

=head1 SEE ALSO

F<examples/benchmarks/addit.pl>, F<examples/benchmarks/addit.pir>,
F<examples/benchmarks/addit2.pir>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
