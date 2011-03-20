#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $c;

$c := LLVM::Constant::null(LLVM::Type::cstring());
ok( $c, "Constant NULL created");
ok( $c ~~ LLVM::Value, ".. with proper class");

my $i;

$i := LLVM::Constant::integer(42);
ok( $i, "Constant Integer created");
ok( $i ~~ LLVM::Value, ".. with proper class");

done_testing();

# vim: ft=perl6
