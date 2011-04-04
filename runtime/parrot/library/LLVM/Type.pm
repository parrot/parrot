class LLVM::Type is LLVM::Value {

    sub int1()      { LLVM::Type.create(LLVM::call("Int1Type", )) }
    sub int8()      { LLVM::Type.create(LLVM::call("Int8Type", )) }
    sub int16()     { LLVM::Type.create(LLVM::call("Int16Type", )) }
    sub int32()     { LLVM::Type.create(LLVM::call("Int32Type", )) }
    sub int64()     { LLVM::Type.create(LLVM::call("Int64Type", )) }
    sub int($radix) { LLVM::Type.create(LLVM::call("IntType", $radix)) }

    sub float()    { LLVM::Type.create(LLVM::call("FloatType")) }
    sub double()   { LLVM::Type.create(LLVM::call("DoubleType")) }
    sub x86fp80()  { LLVM::Type.create(LLVM::call("X86FP80Type")) }
    sub fp128()    { LLVM::Type.create(LLVM::call("FP128Type")) }
    sub ppcfp128() { LLVM::Type.create(LLVM::call("PPCFP128Type")) }

    multi sub function(LLVM::Type $return, *@args, :$va_args?) {
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

    multi sub pointer(LLVM::Type $type, :$address_space?) {
        LLVM::Type.create(
            LLVM::call("PointerType", $type, $address_space)
        );
    }

    sub void() { LLVM::Type.create(LLVM::call("VoidType", )) };
    sub label() { LLVM::Type.create(LLVM::call("LabelType", )) };
    sub opaque() { LLVM::Type.create(LLVM::call("OpaqueType", )) };

    multi method refine_to(LLVM::Type $to) {
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

    sub opcode_t()      { int32() }

    sub STRING ()       { $STRING; }
    sub STRING_PTR ()   { $STRING_PTR; }
    sub PMC ()          { $PMC; }
    sub PMC_PTR ()      { $PMC_PTR; }
    sub VTABLE ()       { $VTABLE; }
    sub VTABLE_PTR ()   { $VTABLE_PTR; }
    sub INTERP ()       { $INTERP; }
    sub INTERP_PTR ()   { $INTERP_PTR; }

    our $STRING;
    our $STRING_PTR;
    our $PMC;
    our $PMC_PTR;
    our $VTABLE;
    our $VTABLE_PTR;
    our $INTERP;
    our $INTERP_PTR;

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
        $STRING_PTR := pointer($STRING);

        # It will be used in VTABLE and PMC
        my $pmc_forward := opaque();
        my $interp_forward := opaque();

        # Create VTABLE
        $VTABLE := struct(
            # Not handled...
        );
        $VTABLE_PTR := pointer($VTABLE);

        # Create PMC
        $PMC := struct(
            UINTVAL(),              # Parrot_UInt    flags;
            pointer(VTABLE()),      # VTABLE         *vtable;
            pointer(int8()),        # DPOINTER       *data;
            pointer($pmc_forward),  # PMC            *_metadata;
        );
        $pmc_forward.refine_to($PMC);
        $PMC_PTR := pointer($PMC);

        # Create INTERP
        $INTERP := struct(
            $PMC_PTR,   # *ctx;  /* current Context */

            # Other fields aren't handled yet.
        );
        $INTERP_PTR := pointer($INTERP);
        $interp_forward.refine_to($INTERP);
    }
};

# vim: ft=perl6
