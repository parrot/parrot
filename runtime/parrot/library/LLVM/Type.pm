module LLVM::Type {
    sub pointer($type, :$address_space?) {
        %LLVM::F<LLVMPointerType>($type, $address_space);
    }

    sub int1() { %LLVM::F<LLVMInt1Type>() }
    sub int8() { %LLVM::F<LLVMInt8Type>() }
    sub int16() { %LLVM::F<LLVMInt16Type>() }
    sub int32() { %LLVM::F<LLVMInt32Type>() }
    sub int64() { %LLVM::F<LLVMInt64Type>() }
    sub int($radix) { %LLVM::F<LLVMIntType>($radix) }

    sub void() { %LLVM::F<LLVMVoidType>() };
};

# vim: ft=perl6
