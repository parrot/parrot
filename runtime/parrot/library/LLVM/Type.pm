class LLVM::Type is LLVM::Opaque {

    multi sub int1() { %LLVM::F<Int1Type>() }
    multi sub int8() { %LLVM::F<Int8Type>() }
    multi sub int16() { %LLVM::F<Int16Type>() }
    multi sub int32() { %LLVM::F<Int32Type>() }
    multi sub int64() { %LLVM::F<Int64Type>() }
    multi sub int($radix) { %LLVM::F<IntType>($radix) }

    sub struct(*@parts, :$packed?) {
        %LLVM::F<StructType>(LLVM::to_array(@parts), +@parts, $packed);
    }

    sub pointer($type, :$address_space?) {
        %LLVM::F<PointerType>($type, $address_space);
    }

    sub void() { %LLVM::F<VoidType>() };
    sub label() { %LLVM::F<LabelType>() };
    sub opaque() { %LLVM::F<OpaqueType>() };
};

# vim: ft=perl6
