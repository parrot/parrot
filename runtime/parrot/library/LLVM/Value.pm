class LLVM::Value is LLVM::Opaque {
    multi method name() {
        %LLVM::F<GetValueName>(self);
    }

    multi method name($name) {
        %LLVM::F<SetValueName>(self, $name);
    }
}

# vim: ft=perl6
