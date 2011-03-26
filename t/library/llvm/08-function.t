#! parrot-nqp

Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

# We need Module and Function to test Builder.
my $m  := LLVM::Module.create("Test");
my $f  := $m.add_function("hello", LLVM::Type::int32());

my $bb1 := $f.append_basic_block();
my $bb2 := $f.append_basic_block();

ok( $bb1 ~~ $f.first_basic_block, "Got first BasicBlock");
ok( $bb2 ~~ $f.last_basic_block, "Got first BasicBlock");

done_testing();

# vim: ft=perl6
