# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/freeze.pasm - Freeze/Thaw Benchmarks

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/freeze.pasm

=head1 DESCRIPTION

Freeze/thaw a Perl array.

=cut

    new P0, .PerlArray
    set I0, 100000
    time N0
lp1:
    push P0, I0
    dec I0
    if I0, lp1
    time N1
    sub N1, N0
    print "constr.time "
    print N1
    print "\n"

    time N0
    freeze S0, P0
    time N1
    sub N1, N0
    print "freeze time "
    print N1
    print "\n"
    # print S0
    # print "\n"

    time N0
    thaw P10, S0
    time N1
    sub N1, N0
    print "  thaw time "
    print N1
    print "\n"

#    time N0
#    clone P11, P0
#    time N1
#    sub N1, N0
#    print " clone time "
#    print N1
#    print "\n"

    print "Image len "
    length I0, S0
    print I0
    print "\n"
    typeof S10, P10
    print S10
    print " "
    set I11, P10
    print I11
    print "\n"
    end

=head1 SEE ALSO

F<examples/benchmarks/freeze.pl>.

=cut
