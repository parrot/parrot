# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/hash-utf8.pasm - UTF-8 Hash Keys

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/hash-utf8.pasm

=head1 DESCRIPTION

 As soon as the first non-ASCII key is stored in a Hash, all keys are
 converted to UTF-8.
 
 This benchmark creates aC<PerlHash> PMC and stores 676 entries. Then
 converts one key to UTF-8 and times 1000000 look-ups.

=cut

    new P1, .PerlHash

    # add 26*26 = 676 entries
    set I0, 65
lp0:
    set I1, 65
lp1:
    chr S0, I0
    chr S1, I1
    concat S0, S1
    set P1[S0], I0
    inc I1
    le I1, 90, lp1
    inc I0
    le I0, 90, lp0

    set I0, P1
    print I0
    print " entries\n"

    # time 1e6 lookups
    time N1
    set I0, 1000000
lp2:
    set I1, P1["AA"]
    dec I0
    if I0, lp2
    time N0
    sub N0, N1
    print "1000000 ASCII key look-ups: "
    print N0
    print "\n"

    # convert one key to utf8
    set S1, "AA"
    delete P1[S1]
    find_encoding I1, "utf8"
    transcode S2, S1, I1
    set P1[S2], 65

    # time 1e6 lookups
    time N1
    set I0, 1000000
lp3:
    set I1, P1["AA"]
    dec I0
    if I0, lp3
    time N0
    sub N0, N1
    print "1000000 UTF-8 key look-ups: "
    print N0
    print "\n"
    print "Value for ASCII key: "
    print I1
    print "\n"
    set I1, P1[S2]
    print "Value for UTF-8 key: "
    print I1
    print "\n"
    end

=head1 SEE ALSO

F<src/hash.c>.

=cut

