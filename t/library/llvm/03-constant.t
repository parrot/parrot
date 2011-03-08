#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $c;

$c := LLVM::Constant::null(LLVM::Type::cstring());
ok( $c, "Constant NULL created");
ok( $c ~~ LLVM::Value, ".. with proper class");


# TODO Add tests for floats

done_testing();

# vim: ft=perl6
