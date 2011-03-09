class LLVM::Type is LLVM::Opaque {

    multi sub int1()      { LLVM::Type.create(LLVM::call("Int1Type", )) }
    multi sub int8()      { LLVM::Type.create(LLVM::call("Int8Type", )) }
    multi sub int16()     { LLVM::Type.create(LLVM::call("Int16Type", )) }
    multi sub int32()     { LLVM::Type.create(LLVM::call("Int32Type", )) }
    multi sub int64()     { LLVM::Type.create(LLVM::call("Int64Type", )) }
    multi sub int($radix) { LLVM::Type.create(LLVM::call("IntType", $radix)) }

    sub float()    { LLVM::Type.create(LLVM::call("FloatType")) }
    sub double()   { LLVM::Type.create(LLVM::call("DoubleType")) }
    sub x86fp80()  { LLVM::Type.create(LLVM::call("X86FP80Type")) }
    sub fp128()    { LLVM::Type.create(LLVM::call("FP128Type")) }
    sub ppcfp128() { LLVM::Type.create(LLVM::call("PPCFP128Type")) }

    sub struct(*@parts, :$packed?) {
        LLVM::Type.create(LLVM::call("StructType", LLVM::to_array(@parts), +@parts, $packed));
    }

    sub pointer($type, :$address_space?) {
        LLVM::Type.create(LLVM::call("PointerType", $type, $address_space));
    }

    sub void() { LLVM::Type.create(LLVM::call("VoidType", )) };
    sub label() { LLVM::Type.create(LLVM::call("LabelType", )) };
    sub opaque() { LLVM::Type.create(LLVM::call("OpaqueType", )) };

    method refine_to(LLVM::Type $to) {
        LLVM::Type.create(
            LLVM::call("RefineType", self, $to)
        );
    }

    # Shortcut for i8*
    sub cstring() { pointer(int8()); }
};

# vim: ft=perl6
