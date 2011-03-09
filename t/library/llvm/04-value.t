#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $val := LLVM::Constant::null(LLVM::Type::cstring());
ok( $val, "Value created");

is( $val.name, "", "Without name");
$val.name("THE_NULL");
is( $val.name, "THE_NULL", "name updated", :todo<Find proper type with name>);

done_testing();

# vim: ft=perl6
