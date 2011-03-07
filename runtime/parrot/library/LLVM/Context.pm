class LLVM::Context is LLVM::Opaque {
    multi method new() {
        self.wrap(%LLVM::F<ContextCreate>());
    }
    multi method new($ptr) { self.wrap($ptr) };

    method DESTROY() {
        %LLVM::F<ContextDispose>(self);
    }

    sub global() {
        LLVM::Context.new(%LLVM::F<GetGlobalContext>());
    }

    method int1() { %LLVM::F<Int1TypeInContext>(self) }
    method int8() { %LLVM::F<Int8TypeInContext>(self) }
    method int16() { %LLVM::F<Int16TypeInContext>(self) }
    method int32() { %LLVM::F<Int32TypeInContext>(self) }
    method int64() { %LLVM::F<Int64TypeInContext>(self) }
    method int($radix) { %LLVM::F<IntTypeInContext>(self, $radix) }

}

# vim: ft=perl6
