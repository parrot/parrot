#! parrot-nqp

pir::load_bytecode("LLVM.pbc");

Q:PIR {
        # We want Test::More features for testing. Not NQP's builtin.
        .include "test_more.pir"
        load_bytecode "dumper.pbc"
};

my $module := LLVM::Module.new.BUILD("HELLO");
$module.dump();

# vim: ft=perl6
