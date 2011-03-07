class LLVM::Context is LLVM::Opaque {
    method BUILD() {
        self.wrap(%LLVM::F<ContextCreate>());
    }

    method DESTROY() {
        %LLVM::F<ContextDispose>(self);
    }

    sub global() {
        LLVM::Context.new.wrap(%LLVM::F<GetGlobalContext>());
    }

}

# vim: ft=perl6
