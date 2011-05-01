module LLVM {
    our %F;

=item call
    Call LLVM with check that function is actually bound.

    sub call($name, *@args) {
        my $m := %F{$name};
        pir::die("Function LLVM{ $name } isn't bound") unless pir::defined($m);
        $m(|@args);
    }

=item convert_to_array
    Convert @args to array used in LLVM API.

    sub to_array(@args) {
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
        pir::loadlib("llvm_engine");

        #### Bind enums

        # For enums we generate new class and bunch of methods.
        sub generate_enum_class($name, $from, @values, &inc? = -> $_ { $_ := $_ + 1 }) {
            my $enum  := P6metaclass.new_class($name);
            my $how   := $enum.HOW;
            for @values {
                my $c := +$from; # Force clone of $count.
                $how.add_method( $_, method () { $c }, to => $enum);
                $from := &inc($from);
            }
        };

=begin
typedef enum {
  LLVMIntEQ = 32, /**< equal */
  LLVMIntNE,      /**< not equal */
  LLVMIntUGT,     /**< unsigned greater than */
  LLVMIntUGE,     /**< unsigned greater or equal */
  LLVMIntULT,     /**< unsigned less than */
  LLVMIntULE,     /**< unsigned less or equal */
  LLVMIntSGT,     /**< signed greater than */
  LLVMIntSGE,     /**< signed greater or equal */
  LLVMIntSLT,     /**< signed less than */
  LLVMIntSLE      /**< signed less or equal */
} LLVMIntPredicate;
=end
        generate_enum_class("LLVM::INT_PREDICATE", 32, <EQ NE UGT UGE ULT ULE SGT SGE SLT SLE>);

=begin
typedef enum {
  LLVMRealPredicateFalse, /**< Always false (always folded) */
  LLVMRealOEQ,            /**< True if ordered and equal */
  LLVMRealOGT,            /**< True if ordered and greater than */
  LLVMRealOGE,            /**< True if ordered and greater than or equal */
  LLVMRealOLT,            /**< True if ordered and less than */
  LLVMRealOLE,            /**< True if ordered and less than or equal */
  LLVMRealONE,            /**< True if ordered and operands are unequal */
  LLVMRealORD,            /**< True if ordered (no nans) */
  LLVMRealUNO,            /**< True if unordered: isnan(X) | isnan(Y) */
  LLVMRealUEQ,            /**< True if unordered or equal */
  LLVMRealUGT,            /**< True if unordered or greater than */
  LLVMRealUGE,            /**< True if unordered, greater than, or equal */
  LLVMRealULT,            /**< True if unordered or less than */
  LLVMRealULE,            /**< True if unordered, less than, or equal */
  LLVMRealUNE,            /**< True if unordered or not equal */
  LLVMRealPredicateTrue   /**< Always true (always folded) */
} LLVMRealPredicate;
=end
        generate_enum_class("LLVM::REAL_PREDICATE", 0, <FALSE OEQ OGT OGE OLT OLE ONE ORD UNO UEQ UGT UGE ULT ULE UNE TRUE>);


=begin
typedef enum {
  LLVMAbortProcessAction, /* verifier will print to stderr and abort() */
  LLVMPrintMessageAction, /* verifier will print to stderr and return 1 */
  LLVMReturnStatusAction  /* verifier will just return 1 */
} LLVMVerifierFailureAction;
=end
        generate_enum_class("LLVM::VERIFYER_FAILURE_ACTION", 0, <ABORT_PROCESSING PRINT_MESSAGE RETURN_STATUS>);

=begin
typedef enum {
  LLVMVoidTypeKind,        /**< type with no size */
  LLVMFloatTypeKind,       /**< 32 bit floating point type */
  LLVMDoubleTypeKind,      /**< 64 bit floating point type */
  LLVMX86_FP80TypeKind,    /**< 80 bit floating point type (X87) */
  LLVMFP128TypeKind,       /**< 128 bit floating point type (112-bit mantissa)*/
  LLVMPPC_FP128TypeKind,   /**< 128 bit floating point type (two 64-bits) */
  LLVMLabelTypeKind,       /**< Labels */
  LLVMIntegerTypeKind,     /**< Arbitrary bit width integers */
  LLVMFunctionTypeKind,    /**< Functions */
  LLVMStructTypeKind,      /**< Structures */
  LLVMArrayTypeKind,       /**< Arrays */
  LLVMPointerTypeKind,     /**< Pointers */
  LLVMOpaqueTypeKind,      /**< Opaque: type with unknown structure */
  LLVMVectorTypeKind,      /**< SIMD 'packed' format, or other vector type */
  LLVMMetadataTypeKind,    /**< Metadata */
  LLVMUnionTypeKind        /**< Unions */
} LLVMTypeKind;
=end
        generate_enum_class("LLVM::TYPE_KIND", 0, <VOID FLOAT DOUBLE X86_FP80 FP128 PPC_FP128 LABEL INTEGER FUNCTION STRUCT ARRAY POINTER OPAQUE VECTOR METADATA UNION>);

            #### Bind functions
        my $parrot_config:= Q:PIR {
                    .include 'iglobals.pasm'
                    .local pmc i
                    i = getinterp
                    %r = i[.IGLOBALS_CONFIG_HASH]
                };
        my $lib   := pir::loadlib__ps($parrot_config<llvm_shared>);
        my %funcs := hash(
#/*===-- Error handling ----------------------------------------------------===*/

            DisposeMessage => "vt",


#/*===-- Contexts ----------------------------------------------------------===*/

#/* Create and destroy contexts. */
            ContextCreate => "p",
            GetGlobalContext => "p",
            ContextDispose => "vp",

            GetMDKindIDInContext => "ipti",
            GetMDKindID => "iti",

#/*===-- Modules -----------------------------------------------------------===*/

#/* Create and destroy modules. */ 
#/** See llvm::Module::Module. */
            ModuleCreateWithName => "pt",
            ModuleCreateWithNameInContext => "ptp",

#/** See llvm::Module::~Module. */
            DisposeModule => "vp",

#/** Data layout. See Module::getDataLayout. */
            GetDataLayout => "tp",
            SetDataLayout => "vpt",

#/** Target triple. See Module::getTargetTriple. */
            GetTarget => "tp",
            SetTarget => "vpt",

#/** See Module::addTypeName. */
            AddTypeName => "iptp",
            DeleteTypeName => "vpt",
            GetTypeByName => "ppt",

#/** See Module::dump. */
            DumpModule => "vp",


#/*===-- Types -------------------------------------------------------------===*/

#/** See llvm::LLVMTypeKind::getTypeID. */
            GetTypeKind => "ip",

#/** See llvm::LLVMType::getContext. */
            GetTypeContext => "pp",

#/* Operations on integer types */
            Int1TypeInContext => "pp",
            Int8TypeInContext => "pp",
            Int16TypeInContext => "pp",
            Int32TypeInContext => "pp",
            Int64TypeInContext => "pp",
            IntTypeInContext => "ppi",

            Int1Type => "p",
            Int8Type => "p",
            Int16Type => "p",
            Int32Type => "p",
            Int64Type => "p",
            IntType => "pi",
            GetIntTypeWidth => "ip",

#/* Operations on real types */
            FloatTypeInContext => "pp",
            DoubleTypeInContext => "pp",
            X86FP80TypeInContext => "pp",
            FP128TypeInContext => "pp",
            PPCFP128TypeInContext => "pp",

            FloatType => "p",
            DoubleType => "p",
            X86FP80Type => "p",
            FP128Type => "p",
            PPCFP128Type => "p",

#/* Operations on function types */
            FunctionType => "pppii",
            IsFunctionVarArg => "ip",
            GetReturnType => "pp",
            CountParamTypes => "ip",
            GetParamTypes => "vpp",

#/* Operations on struct types */
            StructTypeInContext => "pppii",
            StructType => "ppii",
            CountStructElementTypes => "ip",
            GetStructElementTypes => "vpp",
            IsPackedStruct => "ip",

#/* Operations on union types */
            UnionTypeInContext => "pppi",
            UnionType => "ppi",
            CountUnionElementTypes => "ip",
            GetUnionElementTypes => "vpp",

#/* Operations on array, pointer, and vector types (sequence types) */
            ArrayType => "ppi",
            PointerType => "ppi",
            VectorType => "ppi",

            GetElementType => "pp",
            GetArrayLength => "ip",
            GetPointerAddressSpace => "ip",
            GetVectorSize => "ip",

#/* Operations on other types */
            VoidTypeInContext => "pp",
            LabelTypeInContext => "pp",
            OpaqueTypeInContext => "pp",

            VoidType => "p",
            LabelType => "p",
            OpaqueType => "p",

#/* Operations on type handles */
            CreateTypeHandle => "pp",
            RefineType => "vpp",
            ResolveTypeHandle => "pp",
            DisposeTypeHandle => "vp",


#/*===-- Values ------------------------------------------------------------===*/

#/* Operations on all values */
            TypeOf => "pp",
            GetValueName => "tp",
            SetValueName => "vpt",
            DumpValue => "vp",
            ReplaceAllUsesWith => "vpp",
            HasMetadata => "ip",
            GetMetadata => "ppi",
            SetMetadata => "vpip",

# Conversion functions. Return the input value if it is an instance of the
# specified class, otherwise NULL. See llvm::dyn_cast_or_null<>.
# #define LLVM_DECLARE_VALUE_CAST(name) \
# LLVMValueRef LLVMIsA##name(LLVMValueRef Val);
# LLVM_FOR_EACH_VALUE_SUBCLASS(LLVM_DECLARE_VALUE_CAST)
            IsAArgument => "pp",
            IsABasicBlock => "pp",
            IsAInlineAsm => "pp",
            IsAUser => "pp",
            IsAConstant => "pp",
            IsAConstantAggregateZero => "pp",
            IsAConstantArray => "pp",
            IsAConstantExpr => "pp",
            IsAConstantFP => "pp",
            IsAConstantInt => "pp",
            IsAConstantPointerNull => "pp",
            IsAConstantStruct => "pp",
            IsAConstantVector => "pp",
            IsAGlobalValue => "pp",
            IsAFunction => "pp",
            IsAGlobalAlias => "pp",
            IsAGlobalVariable => "pp",
            IsAUndefValue => "pp",
            IsAInstruction => "pp",
            IsABinaryOperator => "pp",
            IsACallInst => "pp",
            IsAIntrinsicInst => "pp",
            IsADbgInfoIntrinsic => "pp",
            IsADbgDeclareInst => "pp",
            IsAEHSelectorInst => "pp",
            IsAMemIntrinsic => "pp",
            IsAMemCpyInst => "pp",
            IsAMemMoveInst => "pp",
            IsAMemSetInst => "pp",
            IsACmpInst => "pp",
            IsAFCmpInst => "pp",
            IsAICmpInst => "pp",
            IsAExtractElementInst => "pp",
            IsAGetElementPtrInst => "pp",
            IsAInsertElementInst => "pp",
            IsAInsertValueInst => "pp",
            IsAPHINode => "pp",
            IsASelectInst => "pp",
            IsAShuffleVectorInst => "pp",
            IsAStoreInst => "pp",
            IsATerminatorInst => "pp",
            IsABranchInst => "pp",
            IsAInvokeInst => "pp",
            IsAReturnInst => "pp",
            IsASwitchInst => "pp",
            IsAUnreachableInst => "pp",
            IsAUnwindInst => "pp",
            IsAUnaryInstruction => "pp",
            IsAAllocaInst => "pp",
            IsACastInst => "pp",
            IsABitCastInst => "pp",
            IsAFPExtInst => "pp",
            IsAFPToSIInst => "pp",
            IsAFPToUIInst => "pp",
            IsAFPTruncInst => "pp",
            IsAIntToPtrInst => "pp",
            IsAPtrToIntInst => "pp",
            IsASExtInst => "pp",
            IsASIToFPInst => "pp",
            IsATruncInst => "pp",
            IsAUIToFPInst => "pp",
            IsAZExtInst => "pp",
            IsAExtractValueInst => "pp",
            IsALoadInst => "pp",
            IsAVAArgInst => "pp",

#/* Operations on Uses */
            GetFirstUse => "pp",
            GetNextUse => "pp",
            GetUser => "pp",
            GetUsedValue => "pp",

#/* Operations on Users */
            GetOperand => "ppi",

#/* Operations on constants of any type */
            ConstNull => "pp",
            ConstAllOnes => "pp",
            GetUndef => "pp",
            IsConstant => "ip",
            IsNull => "ip",
            IsUndef => "ip",
            ConstPointerNull => "pp",

#/* Operations on metadata */
            MDStringInContext => "ppti",
            MDString => "pti",
            MDNodeInContext => "pppi",
            MDNode => "ppi",

#/* Operations on scalar constants */
            ConstInt => "ppii",
            ConstIntOfString => "ppti",
            ConstIntOfStringAndSize => "pptii",
            ConstReal => "ppd",
            ConstRealOfString => "ppt",
            ConstRealOfStringAndSize => "ppti",
            ConstIntGetZExtValue => "ip",
            ConstIntGetSExtValue => "ip",


#/* Operations on composite constants */
            ConstStringInContext => "pptii",
            ConstStructInContext => "pppii",

            ConstString => "ptii",
            ConstArray => "pppi",
            ConstStruct => "ppii",
            ConstVector => "ppi",
            ConstUnion => "ppp",

#/* Constant expressions */
            GetConstOpcode => "ip",
            AlignOf => "pp",
            SizeOf => "pp",
            ConstNeg => "pp",
            ConstNSWNeg => "pp",
            ConstNUWNeg => "pp",
            ConstFNeg => "pp",
            ConstNot => "pp",
            ConstAdd => "ppp",
            ConstNSWAdd => "ppp",
            ConstNUWAdd => "ppp",
            ConstFAdd => "ppp",
            ConstSub => "ppp",
            ConstNSWSub => "ppp",
            ConstNUWSub => "ppp",
            ConstFSub => "ppp",
            ConstMul => "ppp",
            ConstNSWMul => "ppp",
            ConstNUWMul => "ppp",
            ConstFMul => "ppp",
            ConstUDiv => "ppp",
            ConstSDiv => "ppp",
            ConstExactSDiv => "ppp",
            ConstFDiv => "ppp",
            ConstURem => "ppp",
            ConstSRem => "ppp",
            ConstFRem => "ppp",
            ConstAnd => "ppp",
            ConstOr => "ppp",
            ConstXor => "ppp",
            ConstICmp => "pppp",
            ConstFCmp => "pppp",
            ConstShl => "ppp",
            ConstLShr => "ppp",
            ConstAShr => "ppp",
            ConstGEP => "pppi",
            ConstInBoundsGEP => "pppi",
            ConstTrunc => "ppp",
            ConstSExt => "ppp",
            ConstZExt => "ppp",
            ConstFPTrunc => "ppp",
            ConstFPExt => "ppp",
            ConstUIToFP => "ppp",
            ConstSIToFP => "ppp",
            ConstFPToUI => "ppp",
            ConstFPToSI => "ppp",
            ConstPtrToInt => "ppp",
            ConstIntToPtr => "ppp",
            ConstBitCast => "ppp",
            ConstZExtOrBitCast => "ppp",
            ConstSExtOrBitCast => "ppp",
            ConstTruncOrBitCast => "ppp",
            ConstPointerCast => "ppp",
            ConstIntCast => "pppp",
            ConstFPCast => "ppp",
            ConstSelect => "pppp",
            ConstExtractElement => "ppp",
            ConstInsertElement => "pppp",
            ConstShuffleVector => "pppp",
            ConstExtractValue => "pppi",
            ConstInsertValue => "pppii", # FIXME
            ConstInlineAsm => "ppttii",
            BlockAddress => "ppp",

#/* Operations on global variables, functions, and aliases (globals) */
            GetGlobalParent => "pp",
            IsDeclaration => "ip",
            GetLinkage => "ip",
            SetLinkage => "vpi",
            GetSection => "tp",
            SetSection => "vpt",
            GetVisibility => "ip",
            SetVisibility => "vpi",
            GetAlignment => "ip",
            SetAlignment => "vpi",

#/* Operations on global variables */
            AddGlobal => "pppt",
            AddGlobalInAddressSpace => "pppti",
            GetNamedGlobal => "ppt",
            GetFirstGlobal => "pp",
            GetLastGlobal => "pp",
            GetNextGlobal => "pp",
            GetPreviousGlobal => "pp",
            DeleteGlobal => "vp",
            GetInitializer => "vp",
            SetInitializer => "vpp",
            IsThreadLocal => "ip",
            SetThreadLocal => "vpi",
            IsGlobalConstant => "ip",
            SetGlobalConstant => "vpi",

#/* Operations on aliases */
            AddAlias => "ppppt",

#/* Operations on functions */
            AddFunction => "pptp",
            GetNamedFunction => "ppt",
            GetFirstFunction => "pp",
            GetLastFunction => "pp",
            GetNextFunction => "pp",
            GetPreviousFunction => "pp",
            DeleteFunction => "vp",
            GetIntrinsicID => "ip",
            GetFunctionCallConv => "ip",
            SetFunctionCallConv => "vpi",
            GetGC => "tp",
            SetGC => "vpt",
            AddFunctionAttr => "vpi",
            GetFunctionAttr => "ip",
            RemoveFunctionAttr => "vpi",

#/* Operations on parameters */
            CountParams => "ip",
            GetParams => "vpp",
            GetParam => "ppi",
            GetParamParent => "pp",
            GetFirstParam => "pp",
            GetLastParam => "pp",
            GetNextParam => "pp",
            GetPreviousParam => "pp",
            AddAttribute => "vpi",
            RemoveAttribute => "vpi",
            GetAttribute => "ip",
            SetParamAlignment => "vpi",

#/* Operations on basic blocks */
            BasicBlockAsValue => "pp",
            ValueIsBasicBlock => "ip",
            ValueAsBasicBlock => "pp",
            GetBasicBlockParent => "pp",
            CountBasicBlocks => "ip",
            GetBasicBlocks => "vpp",
            GetFirstBasicBlock => "pp",
            GetLastBasicBlock => "pp",
            GetNextBasicBlock => "pp",
            GetPreviousBasicBlock => "pp",
            GetEntryBasicBlock => "pp",

            AppendBasicBlockInContext => "pppt",
            InsertBasicBlockInContext => "pppt",

            AppendBasicBlock => "ppt",
            InsertBasicBlock => "ppt",
            DeleteBasicBlock => "vp",

#/* Operations on instructions */
            GetInstructionParent => "pp",
            GetFirstInstruction => "pp",
            GetLastInstruction => "pp",
            GetNextInstruction => "pp",
            GetPreviousInstruction => "pp",

#/* Operations on call sites */
            SetInstructionCallConv => "vpi",
            GetInstructionCallConv => "ip",
            AddInstrAttribute => "vpii",
            RemoveInstrAttribute => "vpii",
            SetInstrParamAlignment => "vpii",

#/* Operations on call instructions (only) */
            IsTailCall => "ip",
            SetTailCall => "vpi",

#/* Operations on phi nodes */
            AddIncoming => "vpppi",
            CountIncoming => "ip",
            GetIncomingValue => "ppi",
            GetIncomingBlock => "ppi",

#/*===-- Instruction builders ----------------------------------------------===*/

# An instruction builder represents a point within a basic block, and is the
# exclusive means of building instructions using the C interface.

            CreateBuilderInContext => "pp",
            CreateBuilder => "p",
            PositionBuilder => "vppp",
            PositionBuilderBefore => "vpp",
            PositionBuilderAtEnd => "vpp",
            GetInsertBlock => "pp",
            ClearInsertionPosition => "vp",
            InsertIntoBuilder => "vpp",
            InsertIntoBuilderWithName => "vppt",
            DisposeBuilder => "vp",

#/* Metadata */
            SetCurrentDebugLocation => "vpp",
            GetCurrentDebugLocation => "pp",
            SetInstDebugLocation => "vpp",

#/* Terminators */
            BuildRetVoid => "pp",
            BuildRet => "ppp",
            BuildAggregateRet => "pppi",
            BuildBr => "ppp",
            BuildCondBr => "ppppp",
            BuildSwitch => "ppppi",
            BuildIndirectBr => "pppi",
            BuildInvoke => "ppppippt",
            BuildUnwind => "pp",
            BuildUnreachable => "pp",

#/* Add a case to the switch instruction */
            AddCase => "vppp",

#/* Add a destination to the indirectbr instruction */
            AddDestination => "vpp",

#/* Arithmetic */
            BuildAdd => "ppppt",
            BuildNSWAdd => "ppppt",
            BuildNUWAdd => "ppppt",
            BuildFAdd => "ppppt",
            BuildSub => "ppppt",
            BuildNSWSub => "ppppt",
            BuildNUWSub => "ppppt",
            BuildFSub => "ppppt",
            BuildMul => "ppppt",
            BuildNSWMul => "ppppt",
            BuildNUWMul => "ppppt",
            BuildFMul => "ppppt",
            BuildUDiv => "ppppt",
            BuildSDiv => "ppppt",
            BuildExactSDiv => "ppppt",
            BuildFDiv => "ppppt",
            BuildURem => "ppppt",
            BuildSRem => "ppppt",
            BuildFRem => "ppppt",
            BuildShl => "ppppt",
            BuildLShr => "ppppt",
            BuildAShr => "ppppt",
            BuildAnd => "ppppt",
            BuildOr => "ppppt",
            BuildXor => "ppppt",
            BuildBinOp => "ppippt",
            BuildNeg => "pppt",
            BuildNSWNeg => "pppt",
            BuildNUWNeg => "pppt",
            BuildFNeg => "pppt",
            BuildNot => "pppt",

#/* Memory */
            BuildMalloc => "pppt",
            BuildArrayMalloc => "ppppt",
            BuildAlloca => "pppt",
            BuildArrayAlloca => "ppppt",
            BuildFree => "ppp",
            BuildLoad => "pppt",
            BuildStore => "pppp",
            BuildGEP => "ppppit",
            BuildInBoundsGEP => "ppppit",
            BuildStructGEP => "pppit",
            BuildGlobalString => "pptt",
            BuildGlobalStringPtr => "pptt",

#/* Casts */
            BuildTrunc => "ppppt",
            BuildZExt => "ppppt",
            BuildSExt => "ppppt",
            BuildFPToUI => "ppppt",
            BuildFPToSI => "ppppt",
            BuildUIToFP => "ppppt",
            BuildSIToFP => "ppppt",
            BuildFPTrunc => "ppppt",
            BuildFPExt => "ppppt",
            BuildPtrToInt => "ppppt",
            BuildIntToPtr => "ppppt",
            BuildBitCast => "ppppt",
            BuildZExtOrBitCast => "ppppt",
            BuildSExtOrBitCast => "ppppt",
            BuildTruncOrBitCast => "ppppt",
            BuildCast => "ppppt",
            BuildPointerCast => "ppppt",
            BuildIntCast => "ppppt",
            BuildFPCast => "ppppt",

#/* Comparisons */
            BuildICmp => "ppippt",
            BuildFCmp => "ppippt",

#/* Miscellaneous instructions */
            BuildPhi => "pppt",
            BuildCall => "ppppit",
            BuildSelect => "pppppt",
            BuildVAArg => "ppppt",
            BuildExtractElement => "ppppt",
            BuildInsertElement => "pppppt",
            BuildShuffleVector => "pppppt",
            BuildExtractValue => "ppppit",
            BuildInsertValue => "ppppit",

            BuildIsNull => "pppt",
            BuildIsNotNull => "pppt",
            BuildPtrDiff => "ppppt",


#/*===-- Module providers --------------------------------------------------===*/

# Changes the type of M so it can be passed to FunctionPassManagers and the
# JIT.  They take ModuleProviders for historical reasons.
            CreateModuleProviderForExistingModule => "pp",

# Destroys the module M.
            DisposeModuleProvider => "vp",


#/*===-- Memory buffers ----------------------------------------------------===*/

            CreateMemoryBufferWithContentsOfFile => "itpt", # FIXME
            CreateMemoryBufferWithSTDIN => "ipt", # FIXME
            DisposeMemoryBuffer => "vp",


#/*===-- Pass Managers -----------------------------------------------------===*/

# Constructs a new whole-module pass pipeline. This type of pipeline is
# suitable for link-time optimization and whole-module transformations.
# See llvm::PassManager::PassManager.
            CreatePassManager => "p",

# Constructs a new function-by-function pass pipeline over the module
# provider. It does not take ownership of the module provider. This type of
# pipeline is suitable for code generation and JIT compilation tasks.
# See llvm::FunctionPassManager::FunctionPassManager. */
            CreateFunctionPassManagerForModule => "pp",

# Deprecated: UseCreateFunctionPassManagerForModule instead. */
#LLVMPassManagerRefCreateFunctionPassManager(LLVMModuleProviderRef MP);

# Initializes, executes on the provided module, and finalizes all of the
# passes scheduled in the pass manager. Returns 1 if any of the passes
# modified the module, 0 otherwise. See llvm::PassManager::run(Module&). */
            RunPassManager => "ipp",

# Initializes all of the function passes scheduled in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doInitialization. */
            InitializeFunctionPassManager => "ip",

# Executes all of the function passes scheduled in the function pass manager
# on the provided function. Returns 1 if any of the passes modified the
# function, false otherwise.
# See llvm::FunctionPassManager::run(Function&). */
            RunFunctionPassManager => "ipp",

# Finalizes all of the function passes scheduled in in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doFinalization. */
            FinalizeFunctionPassManager => "ip",

# Frees the memory of a pass pipeline. For function pipelines, does not free
# the module provider.
# See llvm::PassManagerBase::~PassManagerBase. */
            DisposePassManager => "vp",

##### Transform/Scalar.h
# See llvm::createAggressiveDCEPass function.
            AddAggressiveDCEPass => "vp",

# See llvm::createCFGSimplificationPass function. */
            AddCFGSimplificationPass => "vp",

# See llvm::createDeadStoreEliminationPass function. */
            AddDeadStoreEliminationPass => "vp",

# See llvm::createGVNPass function. */
            AddGVNPass => "vp",

# See llvm::createIndVarSimplifyPass function. */
            AddIndVarSimplifyPass => "vp",

# See llvm::createInstructionCombiningPass function. */
            AddInstructionCombiningPass => "vp",

# See llvm::createJumpThreadingPass function. */
            AddJumpThreadingPass => "vp",

# See llvm::createLICMPass function. */
            AddLICMPass => "vp",

# See llvm::createLoopDeletionPass function. */
            AddLoopDeletionPass => "vp",

# See llvm::createLoopIndexSplitPass function. */
            AddLoopIndexSplitPass => "vp",

# See llvm::createLoopRotatePass function. */
            AddLoopRotatePass => "vp",

# See llvm::createLoopUnrollPass function. */
            AddLoopUnrollPass => "vp",

# See llvm::createLoopUnswitchPass function. */
            AddLoopUnswitchPass => "vp",

# See llvm::createMemCpyOptPass function. */
            AddMemCpyOptPass => "vp",

# See llvm::createPromoteMemoryToRegisterPass function. */
            AddPromoteMemoryToRegisterPass => "vp",

# See llvm::createReassociatePass function. */
            AddReassociatePass => "vp",

# See llvm::createSCCPPass function. */
            AddSCCPPass => "vp",

# See llvm::createScalarReplAggregatesPass function. */
            AddScalarReplAggregatesPass => "vp",

# See llvm::createSimplifyLibCallsPass function. */
            AddSimplifyLibCallsPass => "vp",

# See llvm::createTailCallEliminationPass function. */
            AddTailCallEliminationPass => "vp",

# See llvm::createConstantPropagationPass function. */
            AddConstantPropagationPass => "vp",

# See llvm::demotePromoteMemoryToRegisterPass function. */
            AddDemoteMemoryToRegisterPass => "vp",

##### Target.h
#/*===-- Target Data -------------------------------------------------------===*/

# Creates target data from a target layout string.
# See the constructor llvm::TargetData::TargetData. */
            CreateTargetData => "pt",

# Adds target data information to a pass manager. This does not take ownership
# of the target data.
# See the method llvm::PassManagerBase::add. */
            AddTargetData => "vpp",

# Converts target data to a target layout string. The string must be disposed
# with LLVMDisposeMessage.
# See the constructor llvm::TargetData::TargetData. */
            CopyStringRepOfTargetData => "tp",

# Returns the byte order of a target, either LLVMBigEndian or
# LLVMLittleEndian.
# See the method llvm::TargetData::isLittleEndian. */
            ByteOrder => "ip",

# Returns the pointer size in bytes for a target.
# See the method llvm::TargetData::getPointerSize. */
            PointerSize => "ip",

# Returns the integer type that is the same size as a pointer on a target.
# See the method llvm::TargetData::getIntPtrType. */
            IntPtrType => "pp",

# Computes the size of a type in bytes for a target.
# See the method llvm::TargetData::getTypeSizeInBits. */
            SizeOfTypeInBits => "lpp", # FIXME

# Computes the storage size of a type in bytes for a target.
# See the method llvm::TargetData::getTypeStoreSize. */
            StoreSizeOfType => "lpp", # FIXME

# Computes the ABI size of a type in bytes for a target.
# See the method llvm::TargetData::getTypeAllocSize. */
            ABISizeOfType => "lpp", # FIXME

# Computes the ABI alignment of a type in bytes for a target.
# See the method llvm::TargetData::getTypeABISize. */
            ABIAlignmentOfType => "ipp",

# Computes the call frame alignment of a type in bytes for a target.
# See the method llvm::TargetData::getTypeABISize. */
            CallFrameAlignmentOfType => "ipp",

# Computes the preferred alignment of a type in bytes for a target.
# See the method llvm::TargetData::getTypeABISize. */
            PreferredAlignmentOfType => "ipp",

# Computes the preferred alignment of a global variable in bytes for a target.
# See the method llvm::TargetData::getPreferredAlignment. */
            PreferredAlignmentOfGlobal => "ipp",

# Computes the structure element that contains the byte offset for a target.
# See the method llvm::StructLayout::getElementContainingOffset. */
            ElementAtOffset => "ippl", # FIXME

# Computes the byte offset of the indexed struct element for a target.
# See the method llvm::StructLayout::getElementContainingOffset. */
            OffsetOfElement => "lppi", # FIXME

# Struct layouts are speculatively cached. If a TargetDataRef is alive when
# types are being refined and removed, this method must be called whenever a
# struct type is removed to avoid a dangling pointer in this cache.
# See the method llvm::TargetData::InvalidateStructLayoutInfo. */
            InvalidateStructLayout => "vpp",

# Deallocates a TargetData.
# See the destructor llvm::TargetData::~TargetData. */
            DisposeTargetData => "vp",


# ExecutionEngine.h
            LinkInJIT => "v",
            LinkInInterpreter => "v",

            CreateGenericValueOfInt => "ppli", # FIXME

            CreateGenericValueOfPointer => "pV",

            CreateGenericValueOfFloat => "ppd",

            GenericValueIntWidth => "ip",

            GenericValueToInt => "lpi", # FIXME

            GenericValueToPointer => "Vp",

            GenericValueToFloat => "dpp",

            DisposeGenericValue => "vp",

#/*===-- Operations on execution engines -----------------------------------===*/

#LLVMBool LLVMCreateExecutionEngineForModule(LLVMExecutionEngineRef *OutEE,
#                                            LLVMModuleRef M,
#                                            char **OutError);

#LLVMBool LLVMCreateInterpreterForModule(LLVMExecutionEngineRef *OutInterp,
#                                        LLVMModuleRef M,
#                                        char **OutError);

#LLVMBool LLVMCreateJITCompilerForModule(LLVMExecutionEngineRef *OutJIT,
#                                        LLVMModuleRef M,
#                                        unsigned OptLevel,
#                                        char **OutError);


            DisposeExecutionEngine => "vp",

            RunStaticConstructors => "vp",

            RunStaticDestructors => "vp",

#int LLVMRunFunctionAsMain(LLVMExecutionEngineRef EE, LLVMValueRef F,
#                          unsigned ArgC, const char * const *ArgV,
#                          const char * const *EnvP);

#LLVMGenericValueRef LLVMRunFunction(LLVMExecutionEngineRef EE, LLVMValueRef F,
#                                    unsigned NumArgs,
#                                    LLVMGenericValueRef *Args);

            FreeMachineCodeForFunction => "vpp",

            AddModule => "vpp",

#LLVMBool LLVMRemoveModule(LLVMExecutionEngineRef EE, LLVMModuleRef M,
#                          LLVMModuleRef *OutMod, char **OutError);

#LLVMBool LLVMFindFunction(LLVMExecutionEngineRef EE, const char *Name,
#                          LLVMValueRef *OutFn);

            GetExecutionEngineTargetData => "pp",

            AddGlobalMapping => "vppV",

            GetPointerToGlobal => "Vpp",


# Transform/IPO.h
# See llvm::createArgumentPromotionPass function. */
            AddArgumentPromotionPass => "vp",

# See llvm::createConstantMergePass function. */
            AddConstantMergePass => "vp",

# See llvm::createDeadArgEliminationPass function. */
            AddDeadArgEliminationPass => "vp",

# See llvm::createDeadTypeEliminationPass function. */
            AddDeadTypeEliminationPass => "vp",

# See llvm::createFunctionAttrsPass function. */
            AddFunctionAttrsPass => "vp",

# See llvm::createFunctionInliningPass function. */
            AddFunctionInliningPass => "vp",

# See llvm::createGlobalDCEPass function. */
            AddGlobalDCEPass => "vp",

# See llvm::createGlobalOptimizerPass function. */
            AddGlobalOptimizerPass => "vp",

# See llvm::createIPConstantPropagationPass function. */
            AddIPConstantPropagationPass => "vp",

# See llvm::createLowerSetJmpPass function. */
            AddLowerSetJmpPass => "vp",

# See llvm::createPruneEHPass function. */
            AddPruneEHPass => "vp",

# See llvm::createStripDeadPrototypesPass function. */
            AddStripDeadPrototypesPass => "vp",

# See llvm::createStripSymbolsPass function. */
            AddStripSymbolsPass => "vp",

####### Analysis.h

#typedef enum {
#  LLVMAbortProcessAction, /* verifier will print to stderr and abort() */
#  LLVMPrintMessageAction, /* verifier will print to stderr and return 1 */
#  LLVMReturnStatusAction  /* verifier will just return 1 */
#} LLVMVerifierFailureAction;


# Verifies that a module is valid, taking the specified action if not.
# Optionally returns a human-readable description of any invalid constructs.
# OutMessage must be disposed with LLVMDisposeMessage. */
            VerifyModule => "ipiB", # FIXME

# Verifies that a single function is valid, taking the specified action. Useful
# for debugging. */
            VerifyFunction => "ipi",

####### BitWriter.h
            WriteBitcodeToFile => "ipt", 
####### BitReader.h
            GetBitcodeModule =>  "vPpB",
####### Core.h
            LLVMCreateMemoryBufferWithContentsOfFile => "vPB",

        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, "LLVM" ~ $name, $signature);
        }

####### Parrot added functions
        %F<DumpModuleToString> := pir::dlfunc__ppss(undef, "Parrot_LLVMDumpModuleToString", "SJp")
                                  // die("Ooops");
        %F<DumpValueToString>  := pir::dlfunc__ppss(undef, "Parrot_LLVMDumpValueToString", "SJp");
        %F<DumpTypeToString>   := pir::dlfunc__ppss(undef, "Parrot_LLVMDumpTypeToString", "SJp");

        %F<GetTypeNames>       := pir::dlfunc__ppss(undef, "Parrot_LLVMGetTypeNames", "PJp");
    }
}

# vim: ft=perl6
