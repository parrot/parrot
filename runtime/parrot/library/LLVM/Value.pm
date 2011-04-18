class LLVM::Value is LLVM::Opaque {
    method typeof() {
        LLVM::Type.create(
            LLVM::call("TypeOf", self)
        );
    }

    multi method name() {
        LLVM::call("GetValueName", self);
    }

    multi method name($name) {
        LLVM::call("SetValueName", self, $name);
        self;
    }

    method dump() {
        LLVM::call("DumpValue", self);
    }

    method has_metadata() {
        LLVM::call("HasMetadata", self);
    }

    method get_metadata($kind_id) {
        LLVM::Value.create(
            LLVM::call("GetMetadata", self, $kind_id)
        );
    }

    multi method set_metadata($kind_id, LLVM::Value $node) {
        LLVM::call("SetMetadata", self, $kind_id, $node);
    };

INIT {
    my @types := <
        Argument
        BasicBlock
        InlineAsm
        User
        Constant
        ConstantAggregateZero
        ConstantArray
        ConstantExpr
        ConstantFP
        ConstantInt
        ConstantPointerNull
        ConstantStruct
        ConstantVector
        GlobalValue
        Function
        GlobalAlias
        GlobalVariable
        UndefValue
        Instruction
        BinaryOperator
        CallInst
        IntrinsicInst
        DbgInfoIntrinsic
        DbgDeclareInst
        EHSelectorInst
        MemIntrinsic
        MemCpyInst
        MemMoveInst
        MemSetInst
        CmpInst
        FCmpInst
        ICmpInst
        ExtractElementInst
        GetElementPtrInst
        InsertElementInst
        InsertValueInst
        PHINode
        SelectInst
        ShuffleVectorInst
        StoreInst
        TerminatorInst
        BranchInst
        InvokeInst
        ReturnInst
        SwitchInst
        UnreachableInst
        UnwindInst
        UnaryInstruction
        AllocaInst
        CastInst
        BitCastInst
        FPExtInst
        FPToSIInst
        FPToUIInst
        FPTruncInst
        IntToPtrInst
        PtrToIntInst
        SExtInst
        SIToFPInst
        TruncInst
        UIToFPInst
        ZExtInst
        ExtractValueInst
        LoadInst
        VAArgInst
    >;

    my $HOW  := LLVM::Value.HOW;
    my $WHAT := LLVM::Value.WHAT;

    for @types {
        $HOW.add_method(
            "isA$_",
            multi method () {
                LLVM::Value.create(
                    LLVM::call("IsA$_", self)
                )
            },
            to => $WHAT
        );
    }
}

}



# vim: ft=perl6
