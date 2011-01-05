# Copyright (C) 2001-2005, Parrot Foundation.

=head1 NAME

examples/pasm/coroutine.pasm - Sample co-routines in Parrot

=head1 SYNOPSIS

    % ./parrot examples/pasm/coroutine.pasm

=head1 DESCRIPTION

This shows you how to create two coroutines and C<invoke> them.

=head1 SEE ALSO

F<docs/ops/core.pod>
F<docs/pdds/pdd03_calling_conventions.pod>

=cut

.pcc_sub :main main:

# create a coro and save it on the user stack
.const 'Sub' P0 =  "MYCOROUTINE"
# a coroutine carries state - clone it
clone P0, P0

# create a second coro
clone P1, P0

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
.pcc_sub MYCOROUTINE:
    print "Entry\n"
    yield
    print "Resumed\n"
    yield
    print "Done\n"
    yield

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
