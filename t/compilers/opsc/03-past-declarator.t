#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.


# "Comprehensive" test for creating PAST for op.
# Parse single op and check various aspects of created PAST.

pir::load_bytecode('opsc.pbc');
pir::load_bytecode('dumper.pbc');

Q:PIR{ .include "test_more.pir" };

my $buf := q|
inline op foo(inconst NUM) {
    PMC *foo;
    foo("answer", 42);
}
|;
my $compiler := pir::compreg__Ps('Ops');

my $past := $compiler.compile($buf, target => 'past');

ok(1, "PAST::Node created");
my $op := @($past<ops>)[0];

my $var := $op[0];

ok( $var ~~ PAST::Var, "PAST::Var created" );
ok( $var.isdecl, ".. as declaration" );
is( $var.name, "foo", ".. with proper name" );
is( $var.vivibase, "PMC *", ".. with proper type" );

my $call := $op[1];
ok( $call ~~ PAST::Op, "PAST::op for call created" );
is( $call.pasttype, "call", ".. with pasttype call" );
is( $call.name,     "foo",  ".. with name 'foo'" );
is( +@($call),          2,  ".. with 2 args" );

done_testing();

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
