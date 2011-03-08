#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $type;

$type := LLVM::Type::int1();
ok( $type, "int1 created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$type := LLVM::Type::int8();
ok( $type, "int8 created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$type := LLVM::Type::int16();
ok( $type, "int16 created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$type := LLVM::Type::int32();
ok( $type, "int32 created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$type := LLVM::Type::int64();
ok( $type, "int64 created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$type := LLVM::Type::int(128);
ok( $type, "int(128) created");
ok( $type ~~ LLVM::Type, ".. with proper class");

# TODO Add tests for floats

done_testing();

# vim: ft=perl6
