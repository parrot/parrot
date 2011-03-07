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
#/*===-- Error handling ----------------------------------------------------===*/

            LLVMDisposeMessage => "vt",


#/*===-- Contexts ----------------------------------------------------------===*/

#/* Create and destroy contexts. */
            LLVMContextCreate => "p",
            LLVMGetGlobalContext => "p",
            LLVMContextDispose => "vp",

            LLVMGetMDKindIDInContext => "IptI",
            LLVMGetMDKindID => "ItI",

#/*===-- Modules -----------------------------------------------------------===*/

#/* Create and destroy modules. */ 
#/** See llvm::Module::Module. */
            LLVMModuleCreateWithName => "pt",
            LLVMModuleCreateWithNameInContext => "ptp",

#/** See llvm::Module::~Module. */
            LLVMDisposeModule => "vp",

#/** Data layout. See Module::getDataLayout. */
            LLVMGetDataLayout => "tp",
            LLVMSetDataLayout => "vpt",

#/** Target triple. See Module::getTargetTriple. */
            LLVMGetTarget => "tp",
            LLVMSetTarget => "vpt",

#/** See Module::addTypeName. */
            LLVMAddTypeName => "Iptp",
            LLVMDeleteTypeName => "vpt",
            LLVMGetTypeByName => "ppt",

#/** See Module::dump. */
            LLVMDumpModule => "vp",


#/*===-- Types -------------------------------------------------------------===*/

#/** See llvm::LLVMTypeKind::getTypeID. */
            LLVMGetTypeKind => "pp",

#/** See llvm::LLVMType::getContext. */
            LLVMGetTypeContext => "pp",

#/* Operations on integer types */
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
            LLVMGetIntTypeWidth => "Ip",

#/* Operations on real types */
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

#/* Operations on function types */
            LLVMFunctionType => "pppii",
            LLVMIsFunctionVarArg => "Ip",
            LLVMGetReturnType => "pp",
            LLVMCountParamTypes => "Ip",
            LLVMGetParamTypes => "vpp",

#/* Operations on struct types */
            LLVMStructTypeInContext => "pppii",
            LLVMStructType => "ppii",
            LLVMCountStructElementTypes => "Ip",
            LLVMGetStructElementTypes => "vpp",
            LLVMIsPackedStruct => "Ip",

#/* Operations on union types */
            LLVMUnionTypeInContext => "pppi",
            LLVMUnionType => "ppi",
            LLVMCountUnionElementTypes => "Ip",
            LLVMGetUnionElementTypes => "vpp",

#/* Operations on array, pointer, and vector types (sequence types) */
            LLVMArrayType => "ppi",
            LLVMPointerType => "ppi",
            LLVMVectorType => "ppi",

            LLVMGetElementType => "pp",
            LLVMGetArrayLength => "Ip",
            LLVMGetPointerAddressSpace => "Ip",
            LLVMGetVectorSize => "Ip",

#/* Operations on other types */
            LLVMVoidTypeInContext => "pp",
            LLVMLabelTypeInContext => "pp",
            LLVMOpaqueTypeInContext => "pp",

            LLVMVoidType => "p",
            LLVMLabelType => "p",
            LLVMOpaqueType => "p",

#/* Operations on type handles */
            LLVMCreateTypeHandle => "pp",
            LLVMRefineType => "vpp",
            LLVMResolveTypeHandle => "pp",
            LLVMDisposeTypeHandle => "vp",


#/*===-- Values ------------------------------------------------------------===*/

#/* Operations on all values */
            LLVMTypeOf => "pp",
            LLVMGetValueName => "tp",
            LLVMSetValueName => "vpt",
            LLVMDumpValue => "vp",
            LLVMReplaceAllUsesWith => "vpp",
            LLVMHasMetadata => "Ip",
            LLVMGetMetadata => "ppi",
            LLVMSetMetadata => "vpip",

=begin
/* Conversion functions. Return the input value if it is an instance of the
   specified class, otherwise NULL. See llvm::dyn_cast_or_null<>. */
#define LLVM_DECLARE_VALUE_CAST(name) \
  LLVMValueRef LLVMIsA##name(LLVMValueRef Val);
LLVM_FOR_EACH_VALUE_SUBCLASS(LLVM_DECLARE_VALUE_CAST)
=end

#/* Operations on Uses */
            LLVMGetFirstUse => "pp",
            LLVMGetNextUse => "pp",
            LLVMGetUser => "pp",
            LLVMGetUsedValue => "pp",

#/* Operations on Users */
            LLVMGetOperand => "ppi",

#/* Operations on constants of any type */
            LLVMConstNull => "pp",
            LLVMConstAllOnes => "pp",
            LLVMGetUndef => "pp",
            LLVMIsConstant => "Ip",
            LLVMIsNull => "Ip",
            LLVMIsUndef => "Ip",
            LLVMConstPointerNull => "pp",

#/* Operations on metadata */
            LLVMMDStringInContext => "ppti",
            LLVMMDString => "pti",
            LLVMMDNodeInContext => "pppi",
            LLVMMDNode => "ppi",

#/* Operations on scalar constants */
            LLVMConstInt => "ppii",
            LLVMConstIntOfString => "ppti",
            LLVMConstIntOfStringAndSize => "pptii",
            LLVMConstReal => "ppd",
            LLVMConstRealOfString => "ppt",
            LLVMConstRealOfStringAndSize => "ppti",
            LLVMConstIntGetZExtValue => "Ip",
            LLVMConstIntGetSExtValue => "Ip",


#/* Operations on composite constants */
            LLVMConstStringInContext => "pptii",
            LLVMConstStructInContext => "pppii",

            LLVMConstString => "ptii",
            LLVMConstArray => "pppi",
            LLVMConstStruct => "ppii",
            LLVMConstVector => "ppi",
            LLVMConstUnion => "ppp",

#/* Constant expressions */
            LLVMGetConstOpcode => "ip",
            LLVMAlignOf => "pp",
            LLVMSizeOf => "pp",
            LLVMConstNeg => "pp",
            LLVMConstNSWNeg => "pp",
            LLVMConstNUWNeg => "pp",
            LLVMConstFNeg => "pp",
            LLVMConstNot => "pp",
            LLVMConstAdd => "ppp",
            LLVMConstNSWAdd => "ppp",
            LLVMConstNUWAdd => "ppp",
            LLVMConstFAdd => "ppp",
            LLVMConstSub => "ppp",
            LLVMConstNSWSub => "ppp",
            LLVMConstNUWSub => "ppp",
            LLVMConstFSub => "ppp",
            LLVMConstMul => "ppp",
            LLVMConstNSWMul => "ppp",
            LLVMConstNUWMul => "ppp",
            LLVMConstFMul => "ppp",
            LLVMConstUDiv => "ppp",
            LLVMConstSDiv => "ppp",
            LLVMConstExactSDiv => "ppp",
            LLVMConstFDiv => "ppp",
            LLVMConstURem => "ppp",
            LLVMConstSRem => "ppp",
            LLVMConstFRem => "ppp",
            LLVMConstAnd => "ppp",
            LLVMConstOr => "ppp",
            LLVMConstXor => "ppp",
            LLVMConstICmp => "pppp",
            LLVMConstFCmp => "pppp",
            LLVMConstShl => "ppp",
            LLVMConstLShr => "ppp",
            LLVMConstAShr => "ppp",
            LLVMConstGEP => "pppi",
            LLVMConstInBoundsGEP => "pppi",
            LLVMConstTrunc => "ppp",
            LLVMConstSExt => "ppp",
            LLVMConstZExt => "ppp",
            LLVMConstFPTrunc => "ppp",
            LLVMConstFPExt => "ppp",
            LLVMConstUIToFP => "ppp",
            LLVMConstSIToFP => "ppp",
            LLVMConstFPToUI => "ppp",
            LLVMConstFPToSI => "ppp",
            LLVMConstPtrToInt => "ppp",
            LLVMConstIntToPtr => "ppp",
            LLVMConstBitCast => "ppp",
            LLVMConstZExtOrBitCast => "ppp",
            LLVMConstSExtOrBitCast => "ppp",
            LLVMConstTruncOrBitCast => "ppp",
            LLVMConstPointerCast => "ppp",
            LLVMConstIntCast => "pppp",
            LLVMConstFPCast => "ppp",
            LLVMConstSelect => "pppp",
            LLVMConstExtractElement => "ppp",
            LLVMConstInsertElement => "pppp",
            LLVMConstShuffleVector => "pppp",
            LLVMConstExtractValue => "pppi",
            LLVMConstInsertValue => "pppii", # FIXME
            LLVMConstInlineAsm => "ppttii",
            LLVMBlockAddress => "ppp",

#/* Operations on global variables, functions, and aliases (globals) */
            LLVMGetGlobalParent => "pp",
            LLVMIsDeclaration => "Ip",
            LLVMGetLinkage => "Ip",
            LLVMSetLinkage => "vpi",
            LLVMGetSection => "tp",
            LLVMSetSection => "vpt",
            LLVMGetVisibility => "Ip",
            LLVMSetVisibility => "vpi",
            LLVMGetAlignment => "Ip",
            LLVMSetAlignment => "vpi",

#/* Operations on global variables */
            LLVMAddGlobal => "pppt",
            LLVMAddGlobalInAddressSpace => "pppti",
            LLVMGetNamedGlobal => "ppt",
            LLVMGetFirstGlobal => "pp",
            LLVMGetLastGlobal => "pp",
            LLVMGetNextGlobal => "pp",
            LLVMGetPreviousGlobal => "pp",
            LLVMDeleteGlobal => "vp",
            LLVMGetInitializer => "vp",
            LLVMSetInitializer => "vpp",
            LLVMIsThreadLocal => "Ip",
            LLVMSetThreadLocal => "vpi",
            LLVMIsGlobalConstant => "Ip",
            LLVMSetGlobalConstant => "vpi",

#/* Operations on aliases */
            LLVMAddAlias => "ppppt",

#/* Operations on functions */
            LLVMAddFunction => "pptp",
            LLVMGetNamedFunction => "ppt",
            LLVMGetFirstFunction => "pp",
            LLVMGetLastFunction => "pp",
            LLVMGetNextFunction => "pp",
            LLVMGetPreviousFunction => "pp",
            LLVMDeleteFunction => "vp",
            LLVMGetIntrinsicID => "Ip",
            LLVMGetFunctionCallConv => "Ip",
            LLVMSetFunctionCallConv => "vpi",
            LLVMGetGC => "tp",
            LLVMSetGC => "vpt",
            LLVMAddFunctionAttr => "vpi",
            LLVMGetFunctionAttr => "Ip",
            LLVMRemoveFunctionAttr => "vpi",

#/* Operations on parameters */
            LLVMCountParams => "Ip",
            LLVMGetParams => "vpp",
            LLVMGetParam => "ppi",
            LLVMGetParamParent => "pp",
            LLVMGetFirstParam => "pp",
            LLVMGetLastParam => "pp",
            LLVMGetNextParam => "pp",
            LLVMGetPreviousParam => "pp",
            LLVMAddAttribute => "vpi",
            LLVMRemoveAttribute => "vpi",
            LLVMGetAttribute => "Ip",
            LLVMSetParamAlignment => "vpi",

#/* Operations on basic blocks */
            LLVMBasicBlockAsValue => "pp",
            LLVMValueIsBasicBlock => "Ip",
            LLVMValueAsBasicBlock => "pp",
            LLVMGetBasicBlockParent => "pp",
            LLVMCountBasicBlocks => "Ip",
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

#/* Operations on instructions */
            LLVMGetInstructionParent => "pp",
            LLVMGetFirstInstruction => "pp",
            LLVMGetLastInstruction => "pp",
            LLVMGetNextInstruction => "pp",
            LLVMGetPreviousInstruction => "pp",

#/* Operations on call sites */
            LLVMSetInstructionCallConv => "vpi",
            LLVMGetInstructionCallConv => "Ip",
            LLVMAddInstrAttribute => "vpii",
            LLVMRemoveInstrAttribute => "vpii",
            LLVMSetInstrParamAlignment => "vpii",

#/* Operations on call instructions (only) */
            LLVMIsTailCall => "Ip",
            LLVMSetTailCall => "vpi",

#/* Operations on phi nodes */
            LLVMAddIncoming => "vpppi",
            LLVMCountIncoming => "Ip",
            LLVMGetIncomingValue => "ppi",
            LLVMGetIncomingBlock => "ppi",

#/*===-- Instruction builders ----------------------------------------------===*/

# An instruction builder represents a point within a basic block, and is the
# exclusive means of building instructions using the C interface.

            LLVMCreateBuilderInContext => "pp",
            LLVMCreateBuilder => "p",
            LLVMPositionBuilder => "vppp",
            LLVMPositionBuilderBefore => "vpp",
            LLVMPositionBuilderAtEnd => "vpp",
            LLVMGetInsertBlock => "pp",
            LLVMClearInsertionPosition => "vp",
            LLVMInsertIntoBuilder => "vpp",
            LLVMInsertIntoBuilderWithName => "vppt",
            LLVMDisposeBuilder => "vp",

#/* Metadata */
            LLVMSetCurrentDebugLocation => "vpp",
            LLVMGetCurrentDebugLocation => "pp",
            LLVMSetInstDebugLocation => "vpp",

#/* Terminators */
            LLVMBuildRetVoid => "pp",
            LLVMBuildRet => "ppp",
            LLVMBuildAggregateRet => "pppi",
            LLVMBuildBr => "ppp",
            LLVMBuildCondBr => "ppppp",
            LLVMBuildSwitch => "ppppi",
            LLVMBuildIndirectBr => "pppi",
            LLVMBuildInvoke => "ppppippt",
            LLVMBuildUnwind => "pp",
            LLVMBuildUnreachable => "pp",

#/* Add a case to the switch instruction */
            LLVMAddCase => "vppp",

#/* Add a destination to the indirectbr instruction */
            LLVMAddDestination => "vpp",

#/* Arithmetic */
            LLVMBuildAdd => "ppppt",
            LLVMBuildNSWAdd => "ppppt",
            LLVMBuildNUWAdd => "ppppt",
            LLVMBuildFAdd => "ppppt",
            LLVMBuildSub => "ppppt",
            LLVMBuildNSWSub => "ppppt",
            LLVMBuildNUWSub => "ppppt",
            LLVMBuildFSub => "ppppt",
            LLVMBuildMul => "ppppt",
            LLVMBuildNSWMul => "ppppt",
            LLVMBuildNUWMul => "ppppt",
            LLVMBuildFMul => "ppppt",
            LLVMBuildUDiv => "ppppt",
            LLVMBuildSDiv => "ppppt",
            LLVMBuildExactSDiv => "ppppt",
            LLVMBuildFDiv => "ppppt",
            LLVMBuildURem => "ppppt",
            LLVMBuildSRem => "ppppt",
            LLVMBuildFRem => "ppppt",
            LLVMBuildShl => "ppppt",
            LLVMBuildLShr => "ppppt",
            LLVMBuildAShr => "ppppt",
            LLVMBuildAnd => "ppppt",
            LLVMBuildOr => "ppppt",
            LLVMBuildXor => "ppppt",
            LLVMBuildBinOp => "ppippt",
            LLVMBuildNeg => "pppt",
            LLVMBuildNSWNeg => "pppt",
            LLVMBuildNUWNeg => "pppt",
            LLVMBuildFNeg => "pppt",
            LLVMBuildNot => "pppt",

#/* Memory */
            LLVMBuildMalloc => "pppt",
            LLVMBuildArrayMalloc => "ppppt",
            LLVMBuildAlloca => "pppt",
            LLVMBuildArrayAlloca => "ppppt",
            LLVMBuildFree => "ppp",
            LLVMBuildLoad => "pppt",
            LLVMBuildStore => "pppp",
            LLVMBuildGEP => "ppppit",
            LLVMBuildInBoundsGEP => "ppppit",
            LLVMBuildStructGEP => "pppit",
            LLVMBuildGlobalString => "pptt",
            LLVMBuildGlobalStringPtr => "pptt",

#/* Casts */
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
            LLVMBuildCast => "ppppt",
            LLVMBuildPointerCast => "ppppt",
            LLVMBuildIntCast => "ppppt",
            LLVMBuildFPCast => "ppppt",

#/* Comparisons */
            LLVMBuildICmp => "ppippt",
            LLVMBuildFCmp => "ppippt",

#/* Miscellaneous instructions */
            LLVMBuildPhi => "pppt",
            LLVMBuildCall => "ppppit",
            LLVMBuildSelect => "pppppt",
            LLVMBuildVAArg => "ppppt",
            LLVMBuildExtractElement => "ppppt",
            LLVMBuildInsertElement => "pppppt",
            LLVMBuildShuffleVector => "pppppt",
            LLVMBuildExtractValue => "ppppit",
            LLVMBuildInsertValue => "ppppit",

            LLVMBuildIsNull => "pppt",
            LLVMBuildIsNotNull => "pppt",
            LLVMBuildPtrDiff => "ppppt",


#/*===-- Module providers --------------------------------------------------===*/

# Changes the type of M so it can be passed to FunctionPassManagers and the
# JIT.  They take ModuleProviders for historical reasons.
            LLVMCreateModuleProviderForExistingModule => "pp",

# Destroys the module M.
            LLVMDisposeModuleProvider => "vp",


#/*===-- Memory buffers ----------------------------------------------------===*/

            LLVMCreateMemoryBufferWithContentsOfFile => "itpt", # FIXME
            LLVMCreateMemoryBufferWithSTDIN => "ipt", # FIXME
            LLVMDisposeMemoryBuffer => "vp",


#/*===-- Pass Managers -----------------------------------------------------===*/

# Constructs a new whole-module pass pipeline. This type of pipeline is
# suitable for link-time optimization and whole-module transformations.
# See llvm::PassManager::PassManager.
            LLVMCreatePassManager => "p",

# Constructs a new function-by-function pass pipeline over the module
# provider. It does not take ownership of the module provider. This type of
# pipeline is suitable for code generation and JIT compilation tasks.
# See llvm::FunctionPassManager::FunctionPassManager. */
            LLVMCreateFunctionPassManagerForModule => "pp",

# Deprecated: Use LLVMCreateFunctionPassManagerForModule instead. */
#LLVMPassManagerRef LLVMCreateFunctionPassManager(LLVMModuleProviderRef MP);

# Initializes, executes on the provided module, and finalizes all of the
# passes scheduled in the pass manager. Returns 1 if any of the passes
# modified the module, 0 otherwise. See llvm::PassManager::run(Module&). */
            LLVMRunPassManager => "Ipp",

# Initializes all of the function passes scheduled in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doInitialization. */
            LLVMInitializeFunctionPassManager => "Ip",

# Executes all of the function passes scheduled in the function pass manager
# on the provided function. Returns 1 if any of the passes modified the
# function, false otherwise.
# See llvm::FunctionPassManager::run(Function&). */
            LLVMRunFunctionPassManager => "Ipp",

# Finalizes all of the function passes scheduled in in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doFinalization. */
            LLVMFinalizeFunctionPassManager => "Ip",

# Frees the memory of a pass pipeline. For function pipelines, does not free
# the module provider.
# See llvm::PassManagerBase::~PassManagerBase. */
            LLVMDisposePassManager => "vp",

        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, $name, $signature);
        }
    }
}

# vim: ft=perl6
