module LLVM {
    our %F;

    sub convert_to_struct(@args) {
        pir::say("# Got { +@args } args");
        my @init;
        for @args {
            @init.push(-100); # INTVAL. BAD. WE NEED PTR
            @init.push(0);
            @init.push(0);
        }
        my $struct := pir::new__psp('ManagedStruct', @init);

        my $count := 0;
        for @args {
            Q:PIR{
                .local pmc args, count, arg
                args  = find_lex '$struct'
                count = find_lex '$count'
                $I0   = count
                arg   = find_lex '$_'
                $I1   = get_addr arg
                args[$I0] = $I1
            };
            $count++;
        }

        $struct;
    }

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
            LLVMConstArray => "pppi",
            LLVMConstStruct => "ppii",
            LLVMConstVector => "ppi",

# Constant expressions
            LLVMAlignOf => "pp",
            LLVMSizeOf => "pp",

# Operations on global variables, functions, and aliases (globals)
            LLVMGetGlobalParent => "pp",
            LLVMIsDeclaration => "ip",
            LLVMGetLinkage => "ip",
            LLVMSetLinkage => "vpi",
            LLVMGetSection => "tp",
            LLVMSetSection => "vpt",
            LLVMGetVisibility => "ip",
            LLVMSetVisibility => "vpi",
            LLVMGetAlignment => "ip",
            LLVMSetAlignment => "vpi",

            # See llvm::LLVMTypeKind::getTypeID.
            LLVMGetTypeKind => "ip",

            # See llvm::LLVMType::getContext.
            LLVMGetTypeContext => "pp",

            # Operations on integer types
            LLVMInt1TypeInContext => "pp",
            LLVMInt8TypeInContext => "pp",
            LLVMInt16TypeInContext => "pp",
            LLVMInti2TypeInContext => "pp",
            LLVMInt64TypeInContext => "pp",
            LLVMIntTypeInContext => "ppi",

            LLVMInt1Type => "p",
            LLVMInt8Type => "p",
            LLVMInt16Type => "p",
            LLVMInti2Type => "p",
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
            LLVMFunctionType => "pppii",
            LLVMIsFunctionVarArg => "ip",
            LLVMGetReturnType => "pp",
            LLVMCountParamTypes => "pp",
            LLVMGetParamTypes => "pp",

# Operations on struct types
            LLVMStructTypeInContext => "pppii",
            LLVMStructType => "ppii",
            LLVMCountStructElementTypes => "ip",
            LLVMGetStructElementTypes => "vpp",
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
            LLVMGetBasicBlocks => "vpp",
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
            LLVMBuildAggregateRet           => "pppi",
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
            LLVMBuildGEP                => "ppppit",
            LLVMBuildInBoundsGEP        => "ppppit",
            LLVMBuildStructGEP          => "pppit",
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
            LLVMBuildICmp => "ppippt",
            LLVMBuildFCmp => "ppippt",

            # Miscellaneous instructions
            LLVMBuildPhi => "pppt",
            LLVMBuildCall => "ppppit",
            LLVMBuildSelect => "pppppt",
            LLVMBuildVAArg => "ppppt",
            LLVMBuildExtractElement => "ppppt",
            LLVMBuildInsertElement => "pppppt",
            LLVMBuildShuffleVector => "pppppt",
            LLVMBuildExtractValue => "pppit",
            LLVMBuildInsertValue => "ppppit",

            LLVMBuildIsNull => "pppt",
            LLVMBuildIsNotNull => "pppt",
            LLVMBuildPtrDiff => "ppppt",

        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, $name, $signature);
        }
    }
}

# vim: ft=perl6
