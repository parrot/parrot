#! parrot-nqp

Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

# We need Module and Function to test Builder.
my $m  := LLVM::Module.create("Test");
my $f  := $m.add_function("hello", LLVM::Type::int32());
my $bb := $f.append_basic_block();

ok( $bb ~~ LLVM::BasicBlock, "BasicBlock created");

# TODO Add tests for navigation.


done_testing();

# vim: ft=perl6
