#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $c;

$c := LLVM::Constant::null(LLVM::Type::cstring());
ok( $c, "Constant NULL created");
ok( $c ~~ LLVM::Value, ".. with proper class");

my $u;

$u := LLVM::Constant::undef(LLVM::Type::cstring());
ok( $u, "Constant Undef created");
ok( $u ~~ LLVM::Value, ".. with proper class");


my $p;
$p := LLVM::Constant::pointer_null(LLVM::Type::cstring());
ok( $p, "Constant NULL Pointer created");
ok( $p ~~ LLVM::Value, ".. with proper class");

my $i;

$i := LLVM::Constant::integer(42);
ok( $i, "Integer constant created");
ok( $i ~~ LLVM::Value, ".. with proper class");

my $r;

$r := LLVM::Constant::real(3.14);
ok( $r, "Real constant created");
ok( $r ~~ LLVM::Value, ".. with proper class");

my $s;
$s := LLVM::Constant::string("OK");
ok( $s, "String constant created");
ok( $s ~~ LLVM::Value, ".. with proper class");

done_testing();

# vim: ft=perl6
