class LLVM::Value is LLVM::Opaque {
    method typeof() {
        LLVM::Type.create(
            LLVM::Call("TypeOf", self)
        );
    }

    multi method name() {
        LLVM::call("GetValueName", self);
        self;
    }

    multi method name($name) {
        LLVM::call("SetValueName", self, $name);
        self;
    }

    method dump() {
        LLVM::call("DumpValue", self);
    }
}

# vim: ft=perl6
