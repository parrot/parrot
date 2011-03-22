#! parrot-nqp

Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

# We need Module and Function to test Builder.
my $m  := LLVM::Module.create("Test");
my $f  := $m.add_function("hello", LLVM::Type::int32());
my $bb := $f.append_basic_block();

ok( $bb ~~ LLVM::BasicBlock, "BasicBlock created");

# Add next block to Function and check that first.next is second
my $bb2 := $f.append_basic_block();
ok( $bb.next() ~~ $bb2, "first.next == second");
ok( $bb2, "first.next defined" );

my $bb3 := $bb2.next();
ok( !$bb3, "last.next produce undef" );

ok( $bb.next().prev() ~~ $bb, "first.next.prev == first");

done_testing();

# vim: ft=perl6
