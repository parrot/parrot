class LLVM::PassManager is LLVM::Opaque {
    # List of available passes
    # TODO: Add all of them here.
    our %PASS := hash(
        ConstantPropagationPass     => 1,
        InstructionCombiningPass    => 1,
        PromoteMemoryToRegisterPass => 1,
        GVNPass                     => 1,
        CFGSimplificationPass       => 1,
        FunctionInliningPass        => 1,
    );

    # Optimizations used by default
    our @DEFAULT_OPTIMIZATIONS := <
        ConstantPropagationPass
        InstructionCombiningPass
        PromoteMemoryToRegisterPass
        GVNPass
        CFGSimplificationPass
        FunctionInliningPass
    >;

    method create(:$optimize?) {
        my $res := self.new.wrap(%LLVM::F<CreatePassManager>());

        if $optimize {
            $res.add($_) for @DEFAULT_OPTIMIZATIONS;
        }

        $res;
    }

    method DESTROY() {
        %LLVM::F<DisposePassManager>(self);
    }

    method add(Str $name) {
        my $m := %LLVM::F{"Add" ~ $name};
        pir::die("Unknown pass $name") unless pir::defined($m);
        $m(self);
    }

    method run(LLVM::Module $module) {
        %LLVM::F<RunPassManager>(self, $module);
    }
}

# vim: ft=perl6
