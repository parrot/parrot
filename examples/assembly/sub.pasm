# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/sub.pasm - Subroutines

=head1 SYNOPSIS

    % ./parrot examples/assembly/sub.pasm

=head1 DESCRIPTION

Sample subroutines in Parrot. 

Shows you how to create a C<.Sub> and C<save> it, create a 2nd C<.Sub>
and C<invoke> it, and then C<restore> the 1st C<.Sub> and C<invoke> it.

=cut

# Create 2 subroutines
#
set_addr I0, SUB
new P0, .Sub
set P0, I0
save P0
new P0, .Sub
set P0, I0
invokecc # Call the sub in P0, store the current continuation in P1
restore P0
# Call second one
invokecc
end

# A subroutine
SUB:
print "Hello subroutine\n"
invoke P1

