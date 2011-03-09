#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $module := LLVM::Module.create("HELLO");
ok( $module, "Module created");

my $function := $module.add_function("hello", LLVM::Type::int32());
ok( $function, "Function added");

done_testing();

# vim: ft=perl6

