# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/substr.pasm - Substring

=head1 SYNOPSIS

    % ./parrot examples/assembly/substr.pasm

=head1 DESCRIPTION

A C<substr> version of "Hello World".

=cut

        set    I2, 1
        set    I1, 0
        set    S1, "Hello World"
        set    I3, 0
        set    I4, 0
        length I5, S1
WAX:    substr S2, S1, I3, I4
        print  S2
        print  "\n"
        add    I4, I4, I2
        eq     I4, I5, WANE
	branch WAX
WANE:   length I1, S1
        print  S1
        print  "\n"
        chopn  S1, 1
        eq     I1, I3, DONE
	branch WANE
DONE:   end
