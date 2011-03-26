#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("opsc.pbc");


# Some preparation
my $pir    := 't/compilers/opsc/data/03.pir';
my $pbc    := subst($pir, / 'pir' $/, 'pbc');

# Generate PBC file
my @args   := list("./parrot", "-o", $pbc, $pir);
my $res    := pir::spawnw__ip(@args);

# OpLib
my $oplib := pir::new__psp("OpLib", "core_ops");

# Parse "jitted.ops"
my $ops_file := Ops::File.new("t/jit/jitted.ops",
    :oplib($oplib),
    :core(0),
    :quiet(0),
);

my $jitter := Ops::JIT.new($pbc, $ops_file, $oplib);

ok( 1, "Ops::JIT created");

my %jit_context := $jitter._create_jit_context(0);
ok( %jit_context, "JIT context created" );

# Handle our single function
%jit_context := $jitter._create_jitted_function(%jit_context, 0);
my $sub := %jit_context<jitted_sub>;
ok( $sub, "JITted function created" );

# We should have "entry" & "leave" blocks.
my $count := 0;
my $bb := $sub.first_basic_block;
while $bb {
    $count++;
    $bb := $bb.next;
}

is( $count, 2, "We have 2 BasicBlocks" );

%jit_context := $jitter._create_basic_blocks(%jit_context);
$count := 0;
$bb := $sub.first_basic_block;
while $bb {
    $count++;
    $bb := $bb.next;
}

# C<end> added automatically by IMCC.
is( $count, 6, "We have 6 BasicBlocks" );

%jit_context := $jitter._jit_ops(%jit_context);
ok( 1, "Sub jitted" );

#$sub.dump();

%jit_context<_module>.verify();
ok( 1, "Module verifyed" );

done_testing();
# vim: ft=perl6
