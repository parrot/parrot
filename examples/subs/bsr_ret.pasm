# Copyright (C) 2001-2005, Parrot Foundation.

=head1 NAME

examples/subs/bsr_ret.pasm - Branch to location

=head1 SYNOPSIS

    % ./parrot examples/subs/bsr_ret.pasm

=head1 DESCRIPTION

Shows branching and returning to a location saved on the call stack.

=head1 SEE ALSO

F<docs/ops/core.pod>
F<docs/pdds/pdd03_calling_conventions.pod>

=cut

MAIN:
    new P1, 'ResizableIntegerArray'
    print "Main\n"
    local_branch P1, TESTSUB
    print "Main: Return from TestSub\n"
END:
    end


TESTSUB:
    print "TestSub\n"
    local_branch P1, NESTSUB
    print "TestSub: Ret from NestSub\n"
    local_return P1

NESTSUB:
    print "NestSub\n"
    local_return P1

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
