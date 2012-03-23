#! ./parrot-nqp
# Copyright (C) 2011, Parrot Foundation.

# "Comprehensive" test for creating PAST for C macros.
# Parse single op and check various aspects of created PAST.

my $pbc := pir::load_bytecode__ps("opsc.pbc");
for $pbc.subs_by_tag('load') -> $sub { $sub(); }
$pbc := pir::load_bytecode__ps("dumper.pbc");
for $pbc.subs_by_tag('load') -> $sub { $sub(); }

Q:PIR{ .include "test_more.pir" };


# TESTS GOES HERE.

done_testing();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
