#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $b := LLVM::Builder.create();
ok( $b, "LLVM::Builder created");

$b.DESTROY();
ok( !$b, "LLVM::Builder destroyed");

# We need Module and Function to test Builder.
my $m  := LLVM::Module.create("Test");
my $f  := $m.add_function("hello", LLVM::Type::int32());
my $bb := $f.append_basic_block();

$b.set_position($bb);
ok(1, "Builder positioned");

my $res;
$res := $b.ret();
ok($res ~~ LLVM::Value, "void return created")


done_testing();

# vim: ft=perl6
