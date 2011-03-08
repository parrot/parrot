#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $b := LLVM::Builder.create();
ok( $b, "LLVM::Builder created");

$b.DESTROY();
ok( !$b, "LLVM::Builder destroyed");


done_testing();

# vim: ft=perl6
