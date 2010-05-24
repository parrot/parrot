#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

# Checking for OpLib num and skip files parsing.

pir::load_bytecode("opsc.pbc");

plan(5);

my $lib := Ops::OpLib.new(
    :num_file('src/ops/ops.num'),
    :skip_file('src/ops/ops.skip'),
);

# It's 1200 currently. But testing for exact match isn't nessary.
ok( $lib.max_op_num > 1000, "ops.num file parsed");
say('# ' ~ $lib.max_op_num);

# Check couple random ops.
ok( $lib.op_num_table<end> == 0, "'end' has code 0");
ok( $lib.op_num_table<set_addr_p_i> != 42, "'set_addr_p_i' have non 0 code");

ok( $lib.op_skip_table<abs_i_ic>,       "'abs_i_ic' in skiptable");
ok( $lib.op_skip_table<ne_nc_nc_ic>,    "'ne_nc_nc_ic' in skiptable");
#_dumper($lib.skiptable);

# vim: expandtab shiftwidth=4 ft=perl6:
