#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$


# "Comprehensive" test for creating PAST for op.
# Parse single op and check various aspects of created PAST.

pir::load_bytecode('opsc.pbc');
pir::load_bytecode('dumper.pbc');

plan(26);

my $buf := q|
BEGIN_OPS_PREAMBLE
/*
THE HEADER
*/
END_OPS_PREAMBLE

op bar() {
    # Nothing here
}

inline op foo(out INT, in PMC, inconst NUM) :flow :deprecated {
    foo # We don't handle anything in C<body> during parse/past.
}

|;
my $compiler := pir::compreg__Ps('Ops');

my $past := $compiler.compile($buf, target => 'past');

ok(1, "PAST::Node created");

my $preambles := $past<preamble>;

ok(~$preambles[0] ~~ /HEADER/, 'Header parsed');

my @ops := @($past<ops>);
# One "bar" and two "foo"
ok(+@ops ==  3, 'We have 3 ops');

my $op := @ops[1];
ok($op.name == 'foo', "Name parsed");

my %flags := $op<flags>;
ok(%flags<flow>, ':flow flag parsed');
ok(%flags<deprecated>, ':deprecated flag parsed');
ok(%flags == 2, "And there are only 2 flags");

# Check op params
my @args := $op<args>;
ok(+@args == 3, "Got 3 parameters");

my $arg;

$arg := @args[0];
ok($arg<direction> eq 'out', 'First direction is correct');
ok($arg<type> eq 'INT', 'First type is correct');

$arg := @args[1];
ok($arg<direction> eq 'in', 'Second direction is correct');
ok($arg<type> eq 'PMC', 'Second type is correct');

$arg := @args[2];
ok($arg<direction> eq 'inconst', 'Third direction is correct');
ok($arg<type> eq 'NUM', 'Third type is correct');

# Check normalization
@args := $op<normalized_args>;
$arg := @args[0];
ok($arg<direction> eq 'o', 'First direction is correct');
ok($arg<type> eq 'i', 'First type is correct');
ok(!($arg<variant>), 'First arg without variant');

$arg := @args[1];
ok($arg<direction> eq 'i', 'Second direction is correct');
ok($arg<type> eq 'p', 'Second type is correct');
ok($arg<variant> eq 'pc', 'Second variant is correct');

$arg := @args[2];
ok($arg<direction> eq 'i', 'Third direction is correct');
ok($arg<type> eq 'nc', 'Third type is correct');
ok(!($arg<variant>), 'Third arg without variant');

ok( ($op.arg_types).join('_') eq 'i_p_nc', "First variant correct");


# Second created op should have _pc_
$op := @ops[2];
ok( $op.arg_types.join('_') eq 'i_pc_nc', "Second variant correct");

# Check body munching.
$op := @ops[0];
my $goto_offset := 0;
for @($op) {
    $goto_offset := $goto_offset || $_<name> eq 'goto_offset';
}
ok( $goto_offset, "goto NEXT appended for non :flow ops");


# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:
