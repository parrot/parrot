#! parrot-nqp

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("LLVM.pbc");

my $module := LLVM::Module.create("HELLO");
ok( $module, "Module created");

my $f1 := $module.add_function("hello", LLVM::Type::int32());
ok( $f1, "Function added");
ok( $f1 ~~ LLVM::Function, ".. with proper type");

my $f2 := $module.add_function("bye", LLVM::Type::int32());
ok( $f2, "Second function added");
ok( $f2 ~~ LLVM::Function, ".. with proper type");

my $ff := $module.first_function();
ok( $ff, "First function fetched" );

my $lf := $module.last_function();
ok( $lf, "Last function fetched" );

ok( $ff.next() ~~ $lf, "first.next == last" );
ok( $lf.prev() ~~ $ff, "last.prev == first" );


done_testing();

# vim: ft=perl6

