class LLVM::Builder is LLVM::Opaque {

    multi method create () {
        self.new.wrap( LLVM::call("CreateBuilder", ) );
    }

    multi method create ($context) {
        self.new.wrap( LLVM::call("CreateBuilderInContext", $context) );
    }

    method DESTROY () {
        LLVM::call("DisposeBuilder", self);
    }

#            LLVMPositionBuilder             => "vppp",
    multi method set_position(LLVM::BasicBlock $bb, $value) {
        LLVM::call("PositionBuilder", self, $bb, $value);
    }

#            LLVMPositionBuilderBefore       => "vpp",
    multi method set_position($value) {
        LLVM::call("PositionBuilderBefore", self, $value);
    }

#            LLVMPositionBuilderAtEnd        => "vpp",
    multi method set_position(LLVM::BasicBlock $bb) {
        LLVM::call("PositionBuilderAtEnd", self, $bb);
    }

#            LLVMGetInsertBlock              => "pp",
#            LLVMClearInsertionPosition      => "vp",
#            LLVMInsertIntoBuilder           => "vpp",
#            LLVMInsertIntoBuilderWithName   => "vppt",
#            LLVMDisposeBuilder              => "vp",

#            # Terminators
#            LLVMBuildRetVoid                => "pp",
    multi method ret() {
        LLVM::Value.create(
            LLVM::call("BuildRetVoid", self)
        );
    }

#            LLVMBuildRet                    => "ppp",
    multi method ret($value) {
        LLVM::Value.create(
            LLVM::call("BuildRet", self, $value)
        );
    }
#            LLVMBuildAggregateRet           => "ppp3",
#            LLVMBuildBr                     => "ppp",
#            LLVMBuildCondBr                 => "ppppp",
#            LLVMBuildSwitch                 => "ppppi",
#            LLVMBuildInvoke                 => "ppppippt",
#            LLVMBuildUnwind                 => "pp",
#            LLVMBuildUnreachable            => "pp",

#            # Add a case to the switch instruction */
#            LLVMAddCase => "vppp",

#            # Arithmetic is generated in INIT block.

#            LLVMBuildNeg => "pppt",
#            LLVMBuildNot => "pppt",

#            # Memory
#            LLVMBuildMalloc             => "pppt",
#            LLVMBuildArrayMalloc        => "ppppt",
#            LLVMBuildAlloca             => "pppt",
    method alloca($type, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildAlloca", self, $type, $name)
        );
    }
#            LLVMBuildArrayAlloca        => "ppppt",
#            LLVMBuildFree               => "ppp",
#            LLVMBuildLoad               => "pppt",
    method load($ptr, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildLoad", self, $ptr, $name)
        );
    }
#            LLVMBuildStore              => "pppp",
    method store($value, $ptr) {
        LLVM::Value.create(
            LLVM::call("BuildStore", self, $value, $ptr)
        );
    }

#            LLVMBuildGEP                => "ppppit",
    method gep($type, *@indices, :$name?) {
        my $args := LLVM::to_array(@indices);
        LLVM::Value.create(
            LLVM::call("BuildGEP", self, $type, $args, +@indices, $name // "")
        );
    }

#            LLVMBuildStructGEP          => "ppppt",
    method struct_gep($ptr, Int $idx, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildStructGEP", self, $ptr, $idx, $name)
        );
    }

#            LLVMBuildInBoundsGEP        => "ppppit",
    method inbounds_gep($type, *@indices, :$name?) {
        my $args := LLVM::to_array(@indices);
        LLVM::Value.create(
            LLVM::call("BuildInBoundsGEP", self, $type, $args, +@indices, $name // "")
        );
    }

#            LLVMBuildGlobalString       => "pptt",
    method global_string($value, $name) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalString", self, $value, $name)
        );
    }
#            LLVMBuildGlobalStringPtr    => "pptt",
    method global_string_ptr($value, $name) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalStringPtr", self, $value, $name)
        );
    }

            # Casts are generated

#            # Comparisons
#            LLVMBuildICmp => "ppippt",
    method icmp($op, LLVM::Value $left, LLVM::Value $right, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildICmp", $op, $left, $right, $name)
        )
    }

#            LLVMBuildFCmp => "ppippt",
    method fcmp($op, LLVM::Value $left, LLVM::Value $right, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildFCmp", $op, $left, $right, $name)
        )
    }

#            # Miscellaneous instructions
#            LLVMBuildPhi => "pppt",
#            LLVMBuildCall => "pppp3t", #FIXME

    method call($func, *@args, :$name?) {
        LLVM::call("BuildCall", 
            self,
            $func,
            LLVM::to_array(@args),
            +@args,
            $name // ""
        );
    }
#            LLVMBuildSelect => "pppppt",
#            LLVMBuildVAArg => "ppppt",
#            LLVMBuildExtractElement => "ppppt",
#            LLVMBuildInsertElement => "pppppt",
#            LLVMBuildShuffleVector => "pppppt",
#            LLVMBuildExtractValue => "ppp3t",
#            LLVMBuildInsertValue => "pppp3t",

#            LLVMBuildIsNull => "pppt",
#            LLVMBuildIsNotNull => "pppt",
#            LLVMBuildPtrDiff => "ppppt",

INIT {
    my $HOW  := LLVM::Builder.HOW;
    my $WHAT := LLVM::Builder.WHAT;

    # Generate binary ops
    for <Add NSWAdd FAdd Sub FSub Mul FMul UDiv SDiv ExactSDiv FDiv URem SRem FRem Shl LShr AShr And Or Xor> -> $name {
        my $call    := "Build" ~ $name;
        my $subname := pir::downcase($name);
        $HOW.add_method(
            $subname,
            method (LLVM::Value $left, LLVM::Value $right, :$name?) {
                LLVM::Value.create(
                    LLVM::call($call, self, $left, $right, $name)
                )
            },
            to => $WHAT
        );
    }

    # Generate casts
    for hash(
        Trunc => "trunk",
        ZExt => "zext",
        SExt => "sext",
        FPToUI => "fp_to_ui",
        FPToSI => "fp_to_si",
        UIToFP => "ui_to_fp",
        SIToFP => "si_to_fp",
        FPTrunc => "fp_trunc",
        FPExt => "fp_ext",
        PtrToInt => "ptr_to_int",
        IntToPtr => "int_to_ptr",
        BitCast => "bit_cast",
        ZExtOrBitCast => "zext_or_bit_cast",
        SExtOrBitCast => "sext_or_bit_cast",
        TruncOrBitCast => "trunk_or_bit_cast",
        PointerCast => "pointer_cast",
        IntCast => "int_cast",
        FPCast => "fp_cast",
    ).kv -> $call, $subname {
        $HOW.add_method(
            $subname,
            method (LLVM::Value $value, LLVM::Type $type, :$name?) {
                LLVM::Value.create(
                    LLVM::call("LLVMBuild" ~ $call, self, $value, $type, $name)
                )
            },
            to => $WHAT
        );
    }
}

};

# vim: ft=perl6
