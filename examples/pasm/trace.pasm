# Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

examples/pasm/trace.pasm - Tracing

=head1 SYNOPSIS

    % ./parrot examples/pasm/trace.pasm

=head1 DESCRIPTION

Shows you what happens when you turn on tracing.

=cut

sweepoff
print "Howdy!\n"
trace 1
print "There!\n"
trace 0
print "Partner!\n"
end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
