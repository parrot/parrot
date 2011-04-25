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

my $hello := $module.find_function("hello");
ok( $hello ~~ $f1, "Function found by name" );

# Types
my $type_name := "struct.FOO";
my $added := $module.add_type($type_name, LLVM::Type::struct());
ok( $added, "Type added" );

$added := $module.add_type($type_name, LLVM::Type::struct());
nok( $added, "Duplicated type not added" );

my $type := $module.get_type($type_name);
ok( $type, "Type found" );
ok( $type ~~ LLVM::Type, ".. with proper type");

# Check module dump.
my $s := $module.dump();
diag( $s );
ok( $s ~~ / struct.FOO /, ".. dump has struct definition");


$module.delete_type($type_name);
ok( 1, "Type deleted" );

$type := $module.get_type($type_name);
ok( !$type, "Deleted type not found" );



done_testing();

# vim: ft=perl6

