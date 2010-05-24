#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode("opsc.pbc");
pir::load_bytecode("nqp-setting.pbc");

plan(7);

my $oplib := Ops::OpLib.new;
my @files := <
    src/ops/core.ops
    src/ops/math.ops
>;

my $f := Ops::File.new(:oplib($oplib), |@files, :core(1));

my @ops := $f.ops;
# 84 core
# 116 math
# We can generate more than 1 Ops::Op per op due args expansion.
say( "# Parsed " ~ +@ops);
# There is more than 300 ops in this 2 files.
# Feel free to update number if you change them.
ok(+@ops == 306, "Ops parsed correctly");
say('# ' ~ +@ops);

my $op := @ops[0];
#_dumper($op);
# First op should be C<end> and has code 0.
ok($op.name eq 'end',   "First op is end");
ok($op<code> == 0,      "... with code 0");

$op := @ops[(+@ops)-1];
ok($op.name eq 'tanh',  "Last op is tanh");
say('# ' ~ $op.name);
ok($op<code> > 84 + 116,    "... with non zero code");

my $version := join(' ', |$f.version);
ok( $version ~~ /^\d+ \s \d+ \s \d+$/, "Version parsed");
say("# $version");

ok( $f.preamble ~~ /pmc_parrotlibrary.h/, "Preamble preserved");

# vim: expandtab shiftwidth=4 ft=perl6:
