# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/assembly/coroutine.pasm - Sample co-routines in Parrot

=head1 SYNOPSIS

    % ./parrot examples/assembly/coroutine.pasm

=head1 DESCRIPTION

This shows you how to create two coroutines and C<invoke> them.

=cut

set_addr I0, MYCOROUTINE
new P0, .Coroutine
set P0, I0
save P0
new P0, .Coroutine
set P0, I0
# Calling convention says P0 will contain the sub so..
print "Calling 1st co-routine\n"
invoke
invoke
invoke
restore P0
print "Calling 2nd co-routine\n"
invoke
invoke
invoke
end

# A coroutine
MYCOROUTINE:
print "Entry\n"
invoke
print "Resumed\n"
invoke
print "Done\n"
invoke

