class LLVM::PassManager is LLVM::Opaque {
    method create() {
        self.create(%LLVM::F<CreatePassManager>());
    }
}

# vim: ft=perl6
