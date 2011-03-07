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

    method int1() { %LLVM::F<Int1TypeInContext>(self) }
    method int8() { %LLVM::F<Int8TypeInContext>(self) }
    method int16() { %LLVM::F<Int16TypeInContext>(self) }
    method int32() { %LLVM::F<Int32TypeInContext>(self) }
    method int64() { %LLVM::F<Int64TypeInContext>(self) }
    method int($radix) { %LLVM::F<IntTypeInContext>(self, $radix) }

}

# vim: ft=perl6
