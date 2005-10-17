# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pasm/99beer.pasm - Mmmm, beer good

=head1 SYNOPSIS

    % ./parrot examples/pasm/99beer.pasm

=head1 DESCRIPTION

An eager beer drinking loop, which shows you how to set variables, do
conditional branching and decrementing.

=cut

set I1, 99 # bottles of beer
set I2, 1  # single bottle

set S1, " of beer on the wall,\n"
set S2, " of beer,\n"
set S3, "Take one down, pass it around,\n"
set S4, " of beer on the wall.\n\n"

set S5, " bottle"
set S6, " bottles"

set S7, "No more bottles of beer on the wall.\n\n"

set S8, "*Buuurrp*\n"

branch N_BOTTLES # start drinking

N_BOTTLES:
        print I1
        print S6
        print S1
        print I1
        print S6
        print S2
        print S3
        dec I1
        eq I1, I2, BOTTLE_OF # Aww, we're getting low
        print I1
        print S6
        print S4
        ne I1, I2, N_BOTTLES # keep on drinking

BOTTLE_OF:
        print I1
        print S5
        print S4
        branch ONE_BOTTLE # 'bout time for a liver transplant

ONE_BOTTLE: # it's been fun
        print I1
        print S5
        print S1
        print I1
        print S5
        print S2
        print S3
        print S7
        print S8
        end
