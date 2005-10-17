# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pasm/coroutine.pasm - Sample co-routines in Parrot

=head1 SYNOPSIS

    % ./parrot examples/pasm/coroutine.pasm

=head1 DESCRIPTION

This shows you how to create two coroutines and C<invoke> them.

=cut

# create a coro and save it on the user stack
newsub P0, .Coroutine, MYCOROUTINE

# create a second coro
newsub P1, .Coroutine, MYCOROUTINE

# Calling convention says P0 will contain the sub so..
print "Calling 1st co-routine\n"
invokecc P0
invokecc P0
invokecc P0

print "Calling 2nd co-routine\n"
invokecc P1
invokecc P1
invokecc P1

end

# A coroutine
MYCOROUTINE:
    print "Entry\n"
    yield
    print "Resumed\n"
    yield
    print "Done\n"
    yield

