class LLVM::Value is LLVM::Opaque {
    multi method name() {
        LLVM::call("GetValueName", self);
    }

    multi method name($name) {
        LLVM::call("SetValueName", self, $name);
    }
}

# vim: ft=perl6
