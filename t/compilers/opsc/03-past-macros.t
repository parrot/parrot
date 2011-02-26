#! ./parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

# "Comprehensive" test for creating PAST for C macros.
# Parse single op and check various aspects of created PAST.

pir::load_bytecode('opsc.pbc');
pir::load_bytecode('dumper.pbc');

Q:PIR{ .include "test_more.pir" };


# TESTS GOES HERE.

done_testing();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
