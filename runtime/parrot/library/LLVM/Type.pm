class LLVM::Type is LLVM::Value {

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

    sub function(LLVM::Type $return, *@args, :$va_args?) {
        LLVM::Type.create(
            LLVM::call("FunctionType",
                $return,                        # return
                LLVM::to_array(@args),          # parameters
                +@args,                         # number of parameters
                +$va_args,                      # is var args
            )
        )
    }

    sub struct(*@parts, :$packed?) {
        LLVM::Type.create(
            LLVM::call("StructType", LLVM::to_array(@parts), +@parts, $packed)
        );
    }

    sub pointer(LLVM::Type $type, :$address_space?) {
        LLVM::Type.create(
            LLVM::call("PointerType", $type, $address_space)
        );
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

    # Shortcuts for Parrot's types. TODO Get from _config()
    sub INTVAL ()   { int32(); }
    sub UINTVAL ()  { int32(); }
    sub FLOATVAL () { double(); }
    sub STRING ()   { $STRING; }
    sub PMC ()      { $PMC; }
    sub VTABLE ()   { $VTABLE; }

    our $STRING;
    our $PMC;
    our $VTABLE;

    INIT {
        # Create STRING
        $STRING := struct(
            UINTVAL(),          # Parrot_UInt flags;
            pointer(void()),    # void *     _bufstart;
            UINTVAL(),          # size_t     _buflen;
            cstring(),          # char       *strstart;
            UINTVAL(),          # UINTVAL     bufused;
            UINTVAL(),          # UINTVAL     strlen;
            UINTVAL(),          # UINTVAL     hashval;
            pointer(opaque()),  # const struct _str_vtable *encoding;
        );

        # It will be used in VTABLE and PMC
        my $pmc_forward := opaque();

        # Create VTABLE
        $VTABLE := struct();

        # Create PMC
        $PMC := struct(
            UINTVAL(),              # Parrot_UInt    flags;
            pointer(VTABLE()),      # VTABLE         *vtable;
            pointer(int8()),        # DPOINTER       *data;
            pointer($pmc_forward),  # PMC            *_metadata;
        );
        $pmc_forward.refine_to($PMC);
    }
};

# vim: ft=perl6
