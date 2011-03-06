#! parrot-nqp

pir::load_bytecode("LLVM.pbc");

Q:PIR {
        # We want Test::More features for testing. Not NQP's builtin.
        .include "test_more.pir"
        load_bytecode "dumper.pbc"
};

my $module := LLVM::Module.new.BUILD("HELLO");
ok(pir::defined($module), "LLVM::Module created");

my $function := $module.add_function("hello", "");

# This will dump to stderr.
$module.dump();
ok(1, "LLVM::Module dumped");




done_testing();

# vim: ft=perl6
