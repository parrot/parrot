#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

# Checking Ops::Op

pir::load_bytecode("opsc.pbc");

plan(7);

my $op := Ops::Op.new(
    code => 42,
    name => 'set',
    type => 'inline',
    args => <foo bar baz>,
    flags => hash(),
    arg_types => <i i ic>,
);

ok( 1, "Op created");

ok( $op.code == 42,         "... with proper code");
ok( $op.name eq 'set',      "... with proper name");
ok( $op.type eq 'inline',   "... with proper type");
ok( +$op.arg_types == 3,    "... with proper arg_types");
say('# ' ~ $op.arg_types);

ok( $op.full_name eq 'set_i_i_ic', "full_name is correct");

$op := Ops::Op.new(
    name => 'set',
    type => 'inline',
);
ok( $op.full_name eq 'set', "Argless op's full_name is correct");

# vim: expandtab shiftwidth=4 ft=perl6:
