#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $o := LLVM::Opaque.new;
ok( 1, "LLVM::Opaque created");

ok( !$o, "..without inclosed pointer");

my $ptr := "foo";
$o.wrap($ptr);
ok( $o, ".wrap works");

my $enc := $o.unwrap();
ok( 1, ".unwrap works");
is( $ptr, $enc, ".. and returns same pointer");

done_testing();

# vim: ft=perl6
