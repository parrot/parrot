module LLVM {
    our %F;

    INIT {
        pir::load_bytecode("nqp-setting.pbc");

        my $lib   := pir::loadlib("/usr/lib/libLLVM-2.7.so.1");
        my %funcs := hash(
            LLVMModuleCreateWithName    => "pt",
            LLVMDumpModule              => "vp",

# Operations on constants of any type
            LLVMConstNull => "pp",
            LLVMConstAllOnes => "pp",
            LLVMGetUndef   => "pp",
            LLVMIsConstant => "ip",
            LLVMIsNull => "ip",
            LLVMIsUndef => "ip",
            LLVMConstPointerNull => "pp",

# Operations on scalar constants
            LLVMConstInt => "ppii",
            LLVMConstIntOfString => "ppti",
            LLVMConstIntOfStringAndSize => "pptii",
            LLVMConstReal => "ppd",
            LLVMConstRealOfString => "ppt",
            LLVMConstRealOfStringAndSize => "ppti",


# Operations on composite constants
            LLVMConstStringInContext => "pptii",
            LLVMConstStructInContext => "pppii",

            LLVMConstString => "ptii",
            LLVMConstArray => "pppi", # FIXME
            LLVMConstStruct => "ppii", # FIXME
            LLVMConstVector => "ppi", #FIXME

# Constant expressions
            LLVMAlignOf => "pp",
            LLVMSizeOf => "pp",

            # See llvm::LLVMTypeKind::getTypeID.
            LLVMGetTypeKind => "ip",

            # See llvm::LLVMType::getContext.
            LLVMGetTypeContext => "pp",

            # Operations on integer types
            LLVMInt1TypeInContext => "pp",
            LLVMInt8TypeInContext => "pp",
            LLVMInt16TypeInContext => "pp",
            LLVMInt32TypeInContext => "pp",
            LLVMInt64TypeInContext => "pp",
            LLVMIntTypeInContext => "ppi",

            LLVMInt1Type => "p",
            LLVMInt8Type => "p",
            LLVMInt16Type => "p",
            LLVMInt32Type => "p",
            LLVMInt64Type => "p",
            LLVMIntType => "pi",
            LLVMGetIntTypeWidth => "ip",

            # Operations on real types
            LLVMFloatTypeInContext => "pp",
            LLVMDoubleTypeInContext => "pp",
            LLVMX86FP80TypeInContext => "pp",
            LLVMFP128TypeInContext => "pp",
            LLVMPPCFP128TypeInContext => "pp",

            LLVMFloatType => "p",
            LLVMDoubleType => "p",
            LLVMX86FP80Type => "p",
            LLVMFP128Type => "p",
            LLVMPPCFP128Type => "p",

            # Operations on function types
            LLVMFunctionType => "pppii", # FIXME
            LLVMIsFunctionVarArg => "ip",
            LLVMGetReturnType => "pp",
            LLVMCountParamTypes => "pp",
            LLVMGetParamTypes => "pp",

# Operations on struct types
            LLVMStructTypeInContext => "pppii", # FIXME
            LLVMStructType => "ppii", # FIXME
            LLVMCountStructElementTypes => "ip",
            LLVMGetStructElementTypes => "vpp", # FIXME
            LLVMIsPackedStruct => "ip",

# Operations on array, pointer, and vector types
            LLVMArrayType => "ppi",
            LLVMPointerType => "ppi",
            LLVMVectorType => "ppi",

            LLVMGetElementType => "pp",
            LLVMGetArrayLength => "ip",
            LLVMGetPointerAddressSpace => "ip",
            LLVMGetVectorSize => "ip",

# Operations on other types
            LLVMVoidTypeInContext => "pp",
            LLVMLabelTypeInContext => "pp",
            LLVMOpaqueTypeInContext => "pp",

            LLVMVoidType => "p",
            LLVMLabelType => "p",
            LLVMOpaqueType => "p",

            # Operations on basic blocks
            LLVMBasicBlockAsValue => "pp",
            LLVMValueIsBasicBlock => "ip",
            LLVMValueAsBasicBlock => "pp",
            LLVMGetBasicBlockParent => "pp",
            LLVMCountBasicBlocks => "ip",
            LLVMGetBasicBlocks => "vpp", # FIXME
            LLVMGetFirstBasicBlock => "pp",
            LLVMGetLastBasicBlock => "pp",
            LLVMGetNextBasicBlock => "pp",
            LLVMGetPreviousBasicBlock => "pp",
            LLVMGetEntryBasicBlock => "pp",

            LLVMAppendBasicBlockInContext => "pppt",
            LLVMInsertBasicBlockInContext => "pppt",

            LLVMAppendBasicBlock => "ppt",
            LLVMInsertBasicBlock => "ppt",
            LLVMDeleteBasicBlock => "vp",

            # Operations on functions
            LLVMAddFunction => "pptp",
            LLVMGetNamedFunction => "ppt",
            LLVMGetFirstFunction => "pp",
            LLVMGetLastFunction => "pp",
            LLVMGetNextFunction => "pp",
            LLVMGetPreviousFunction => "pp",
            LLVMDeleteFunction    => "vp",
            LLVMGetIntrinsicID => "ip",
            LLVMGetFunctionCallConv => "ip",
            LLVMSetFunctionCallConv => "vpi",
            LLVMGetGC => "tp",
            LLVMSetGC => "vpt",
            LLVMAddFunctionAttr => "vpi",
            LLVMRemoveFunctionAttr => "vpi",

            # Instruction builders 
            LLVMCreateBuilderInContext      => "pp",
            LLVMCreateBuilder               => "pv",

            LLVMPositionBuilder             => "vppp",
            LLVMPositionBuilderBefore       => "vpp",
            LLVMPositionBuilderAtEnd        => "vpp",
            LLVMGetInsertBlock              => "pp",
            LLVMClearInsertionPosition      => "vp",
            LLVMInsertIntoBuilder           => "vpp",
            LLVMInsertIntoBuilderWithName   => "vppt",
            LLVMDisposeBuilder              => "vp",

            # Terminators
            LLVMBuildRetVoid                => "pp",
            LLVMBuildRet                    => "ppp",
            LLVMBuildAggregateRet           => "ppp3",
            LLVMBuildBr                     => "ppp",
            LLVMBuildCondBr                 => "ppppp",
            LLVMBuildSwitch                 => "ppppi",
            LLVMBuildInvoke                 => "ppppippt",
            LLVMBuildUnwind                 => "pp",
            LLVMBuildUnreachable            => "pp",

            # Add a case to the switch instruction */
            LLVMAddCase => "vppp",

            # Arithmetic
            LLVMBuildAdd        => "ppppt",
            LLVMBuildNSWAdd     => "ppppt",
            LLVMBuildFAdd       => "ppppt",
            LLVMBuildSub        => "ppppt",
            LLVMBuildFSub       => "ppppt",
            LLVMBuildMul        => "ppppt",
            LLVMBuildFMul       => "ppppt",
            LLVMBuildUDiv       => "ppppt",
            LLVMBuildSDiv       => "ppppt",
            LLVMBuildExactSDiv  => "ppppt",
            LLVMBuildFDiv       => "ppppt",
            LLVMBuildURem       => "ppppt",
            LLVMBuildSRem       => "ppppt",
            LLVMBuildFRem       => "ppppt",
            LLVMBuildShl        => "ppppt",
            LLVMBuildLShr       => "ppppt",
            LLVMBuildAShr       => "ppppt",
            LLVMBuildAnd        => "ppppt",
            LLVMBuildOr         => "ppppt",
            LLVMBuildXor        => "ppppt",

            LLVMBuildNeg => "pppt",
            LLVMBuildNot => "pppt",

            # Memory
            LLVMBuildMalloc             => "pppt",
            LLVMBuildArrayMalloc        => "ppppt",
            LLVMBuildAlloca             => "pppt",
            LLVMBuildArrayAlloca        => "ppppt",
            LLVMBuildFree               => "ppp",
            LLVMBuildLoad               => "pppt",
            LLVMBuildStore              => "pppp",
            LLVMBuildGEP                => "pppp3t", # FIXME It's array here.
            LLVMBuildInBoundsGEP        => "pppp3t", # FIXME
            LLVMBuildStructGEP          => "ppp3t",
            LLVMBuildGlobalString       => "pptt",
            LLVMBuildGlobalStringPtr    => "pptt",

            # Casts
            LLVMBuildTrunc => "ppppt",
            LLVMBuildZExt => "ppppt",
            LLVMBuildSExt => "ppppt",
            LLVMBuildFPToUI => "ppppt",
            LLVMBuildFPToSI => "ppppt",
            LLVMBuildUIToFP => "ppppt",
            LLVMBuildSIToFP => "ppppt",
            LLVMBuildFPTrunc => "ppppt",
            LLVMBuildFPExt => "ppppt",
            LLVMBuildPtrToInt => "ppppt",
            LLVMBuildIntToPtr => "ppppt",
            LLVMBuildBitCast => "ppppt",
            LLVMBuildZExtOrBitCast => "ppppt",
            LLVMBuildSExtOrBitCast => "ppppt",
            LLVMBuildTruncOrBitCast => "ppppt",
            LLVMBuildPointerCast => "ppppt",
            LLVMBuildIntCast => "ppppt",
            LLVMBuildFPCast => "ppppt",

            # Comparisons
            LLVMBuildICmp => "pp3ppt",
            LLVMBuildFCmp => "pp3ppt",

            # Miscellaneous instructions
            LLVMBuildPhi => "pppt",
            LLVMBuildCall => "pppp3t", #FIXME
            LLVMBuildSelect => "pppppt",
            LLVMBuildVAArg => "ppppt",
            LLVMBuildExtractElement => "ppppt",
            LLVMBuildInsertElement => "pppppt",
            LLVMBuildShuffleVector => "pppppt",
            LLVMBuildExtractValue => "ppp3t",
            LLVMBuildInsertValue => "pppp3t",

            LLVMBuildIsNull => "pppt",
            LLVMBuildIsNotNull => "pppt",
            LLVMBuildPtrDiff => "ppppt",

        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, $name, $signature);
        }
    }
}

