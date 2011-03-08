class LLVM::Type is LLVM::Opaque {

    multi sub int1() { LLVM::call("Int1Type", ) }
    multi sub int8() { LLVM::call("Int8Type", ) }
    multi sub int16() { LLVM::call("Int16Type", ) }
    multi sub int32() { LLVM::call("Int32Type", ) }
    multi sub int64() { LLVM::call("Int64Type", ) }
    multi sub int($radix) { LLVM::call("IntType", $radix) }

    sub struct(*@parts, :$packed?) {
        LLVM::call("StructType", LLVM::to_array(@parts), +@parts, $packed);
    }

    sub pointer($type, :$address_space?) {
        LLVM::call("PointerType", $type, $address_space);
    }

    sub void() { LLVM::call("VoidType", ) };
    sub label() { LLVM::call("LabelType", ) };
    sub opaque() { LLVM::call("OpaqueType", ) };
};

# vim: ft=perl6
