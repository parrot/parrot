#! parrot-nqp

pir::load_bytecode("LLVM.pbc");

Q:PIR {
        # We want Test::More features for testing. Not NQP's builtin.
        .include "test_more.pir"
        load_bytecode "dumper.pbc"
};

my $module := LLVM::Module.new.BUILD("HELLO");
ok(pir::defined($module), "LLVM::Module created");
ok( $module ~~ LLVM::Module, ".. with proper type");

my $function := $module.add_function("hello", "");
ok(pir::defined($function), "Function created");
ok( $function ~~ LLVM::Function, ".. with proper type");


my $bb := $function.append_basic_block("the_block");
ok( pir::defined($bb), "BasicBlock appended");
ok( $bb ~~ LLVM::BasicBlock, ".. with proper type");

my $builder := LLVM::Builder.new.BUILD();
ok( pir::defined($builder), "LLVM::Builder created");
ok( $builder ~~ LLVM::Builder, ".. with proper type");

$builder.set_position($bb);
ok( 1, "Builder positioned");

$builder.ret();
ok( 1, "return created");

# This will dump to stderr.
$module.dump();
ok(1, "LLVM::Module dumped");




done_testing();

# vim: ft=perl6
