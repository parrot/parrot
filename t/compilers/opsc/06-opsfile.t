#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.

pir::load_bytecode("opsc.pbc");
pir::load_bytecode("nqp-setting.pbc");

Q:PIR {
    .include "test_more.pir"
};

my $oplib := Ops::OpLib.new;
my @files := <
    src/ops/core.ops
    src/ops/math.ops
>;

my $f := Ops::File.new(:oplib($oplib), |@files, :core(1));

my @ops := $f.ops;
# 82 core
# 116 math
# We can generate more than 1 Ops::Op per op due args expansion.
diag( "Parsed " ~ +@ops);

my $op := @ops[0];
#_dumper($op);
# First op should be C<end> and has code 0.
is($op.name, 'end',   "First op is correct");
is($op<code>, 0,      "... with code 0");

$op := @ops[(+@ops)-1];
ok($op<code> > 84 + 116,    "Last op has non zero code");

my $version := join(' ', |$f.version);
ok( $version ~~ /^\d+ \s \d+ \s \d+$/, "Version parsed");
diag($version);

ok( $f.preamble ~~ /pmc_parrotlibrary.h/, "Preamble preserved");

done_testing();

# vim: expandtab shiftwidth=4 ft=perl6:
