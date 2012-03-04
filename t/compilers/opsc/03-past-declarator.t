#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.


# "Comprehensive" test for creating PAST for op.
# Parse single op and check various aspects of created PAST.

pir::load_bytecode('opsc.pbc');
pir::load_bytecode('dumper.pbc');

Q:PIR{ .include "test_more.pir" };

my $buf := q|
inline op foo(inconst NUM) {
    PMC * const foo;
    foo();
    foo(bar);
    foo(bar, baz);
    if (answer != 42) {
        answer = 42;
    }
    else {
        question = "what?";
    }
}
|;
my $compiler := pir::compreg__Ps('Ops');

my $past := $compiler.compile($buf, target => 'past');

ok(1, "PAST::Node created");
my $op := @($past<ops>)[0][0];

my $var := $op[0];

ok( $var ~~ PAST::Var, "PAST::Var created" );
ok( $var.isdecl, ".. as declaration" );
is( $var.name, "foo", ".. with proper name" );
is( $var.vivibase, "PMC ", ".. with proper type" );
is( $var<pointer>, "* const ", ".. with proper pointer" );

my $call := $op[1];
ok( $call ~~ PAST::Op, "PAST::op for call created" );
is( $call.pasttype, "call", ".. with pasttype call" );
is( $call.name,     "foo",  ".. with name 'foo'" );
is( +@($call),          0,  ".. with 0 args" );

$call := $op[2];
is( +@($call),          1,  ".. with 1 arg" );
$call := $op[3];
is( +@($call),          2,  ".. with 2 args" );

my $if := $op[4];
ok( $if ~~ PAST::Op,      "PAST::op for if created" );
is( $if.pasttype,   "if", ".. with pasttype call" );
is( +@($if),            3, ".. with 3 children" );


# test while pasttype
$buf := q|
inline op bar(out PMC, in INT) {
    while (1) {
        foo();
    }
}|;
$past := $compiler.compile($buf, target => 'past');
$op := $past<ops>[0];
is( $op[0][0]<pasttype>, 'while', "while loop generates right pasttype");

# test for pasttype
$buf := q|
inline op bar(out PMC, in INT) {
    for (i = 0; i < 111; quux($2)) {
        foo($1);
    }
}|;
$past := $compiler.compile($buf, target => 'past');
$op := $past<ops>[0];
is( $op[0][0]<pasttype>, 'for', "for loop generates right pasttype");

$buf := q|
inline op bar(out PMC, in INT) {
    if (foo) bar(); baz();
}|;
$past := $compiler.compile($buf, target => 'past');
$op := $past<ops>[0];
# if, baz, WB, goto
is( +@($op[0]), 4, "Properly handle single statement in 'if'");


done_testing();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
