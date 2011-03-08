class LLVM::Context is LLVM::Opaque {
    multi method create() {
        LLVM::Context.new.wrap(LLVM::call("ContextCreate"));
    }

    multi method create($ptr) { self.wrap($ptr) };

    method DESTROY() {
        LLVM::call("ContextDispose", self);
    }

    sub global() {
        LLVM::Context.new.wrap(LLVM::call("GetGlobalContext"));
    }

    method int1() { LLVM::call("Int1TypeInContext", self) }
    method int8() { LLVM::call("Int8TypeInContext", self) }
    method int16() { LLVM::call("Int16TypeInContext", self) }
    method int32() { LLVM::call("Int32TypeInContext", self) }
    method int64() { LLVM::call("Int64TypeInContext", self) }
    method int($radix) { LLVM::call("IntTypeInContext", self, $radix) }

}

# vim: ft=perl6
