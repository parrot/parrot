module LLVM::Type {
    sub pointer($type, :$address_space?) {
        %LLVM::F<PointerType>($type, $address_space);
    }

    sub int1() { %LLVM::F<Int1Type>() }
    sub int8() { %LLVM::F<Int8Type>() }
    sub int16() { %LLVM::F<Int16Type>() }
    sub int32() { %LLVM::F<Int32Type>() }
    sub int64() { %LLVM::F<Int64Type>() }
    sub int($radix) { %LLVM::F<IntType>($radix) }

    sub void() { %LLVM::F<VoidType>() };

    sub struct(*@parts, :$packed?) {
        %LLVM::F<StructType>(LLVM::to_array(@parts), +@parts, $packed);
    }
};

# vim: ft=perl6
