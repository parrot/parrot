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

my $ptr := LLVM::Type::pointer(LLVM::Type::int8());
ok( $ptr, "i8* created");
ok( $type ~~ LLVM::Type, ".. with proper class");

$ptr := LLVM::Type::cstring();
ok( $ptr, "shortcut i8* created");
ok( $type ~~ LLVM::Type, ".. with proper class");

# TODO Add tests for floats

# Refine
# Create struc: struct foo { foo *next}
# "something"
my $abstract := LLVM::Type::opaque();

# Struct "foo{ something * }"
my $concrete := LLVM::Type::struct(
    LLVM::Type::pointer($abstract)
);
# "something" -> "foo"
$abstract.refine_to($concrete);
ok( 1, "Refine done");

# I don't know how to check it. But dump should generate
# %struct.foo = type { %struct.foo* }
#my $m := LLVM::Module.create("foo");
#$m.add_type_name("struct.foo", $concrete);
#$m.dump();

done_testing();

# vim: ft=perl6
