# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/sub.pasm - Subroutines

=head1 SYNOPSIS

    % ./parrot examples/assembly/sub.pasm

=head1 DESCRIPTION

Sample subroutines in Parrot.

Shows you how to create a C<.Sub> and C<invoke> it.

=cut

# Create a subroutine
#
    newsub P0, .Sub, _sub
    invokecc # Call the sub in P0, store the current continuation in P1
    end

# A subroutine
_sub:
    print "Hello subroutine\n"
    invoke P1

