module LLVM {
    our %F;

    sub convert_to_struct(@args) {
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

            DisposeMessage => "vt",


#/*===-- Contexts ----------------------------------------------------------===*/

#/* Create and destroy contexts. */
            ContextCreate => "p",
            GetGlobalContext => "p",
            ContextDispose => "vp",

            GetMDKindIDInContext => "IptI",
            GetMDKindID => "ItI",

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
            AddTypeName => "Iptp",
            DeleteTypeName => "vpt",
            GetTypeByName => "ppt",

#/** See Module::dump. */
            DumpModule => "vp",


#/*===-- Types -------------------------------------------------------------===*/

#/** See llvm::LLVMTypeKind::getTypeID. */
            GetTypeKind => "pp",

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
            GetIntTypeWidth => "Ip",

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
            IsFunctionVarArg => "Ip",
            GetReturnType => "pp",
            CountParamTypes => "Ip",
            GetParamTypes => "vpp",

#/* Operations on struct types */
            StructTypeInContext => "pppii",
            StructType => "ppii",
            CountStructElementTypes => "Ip",
            GetStructElementTypes => "vpp",
            IsPackedStruct => "Ip",

#/* Operations on union types */
            UnionTypeInContext => "pppi",
            UnionType => "ppi",
            CountUnionElementTypes => "Ip",
            GetUnionElementTypes => "vpp",

#/* Operations on array, pointer, and vector types (sequence types) */
            ArrayType => "ppi",
            PointerType => "ppi",
            VectorType => "ppi",

            GetElementType => "pp",
            GetArrayLength => "Ip",
            GetPointerAddressSpace => "Ip",
            GetVectorSize => "Ip",

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
            HasMetadata => "Ip",
            GetMetadata => "ppi",
            SetMetadata => "vpip",

# Conversion functions. Return the input value if it is an instance of the
# specified class, otherwise NULL. See llvm::dyn_cast_or_null<>.
# #define LLVM_DECLARE_VALUE_CAST(name) \
# LLVMValueRef LLVMIsA##name(LLVMValueRef Val);
# LLVM_FOR_EACH_VALUE_SUBCLASS(LLVM_DECLARE_VALUE_CAST)

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
            IsConstant => "Ip",
            IsNull => "Ip",
            IsUndef => "Ip",
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
            ConstIntGetZExtValue => "Ip",
            ConstIntGetSExtValue => "Ip",


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
            IsDeclaration => "Ip",
            GetLinkage => "Ip",
            SetLinkage => "vpi",
            GetSection => "tp",
            SetSection => "vpt",
            GetVisibility => "Ip",
            SetVisibility => "vpi",
            GetAlignment => "Ip",
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
            IsThreadLocal => "Ip",
            SetThreadLocal => "vpi",
            IsGlobalConstant => "Ip",
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
            GetIntrinsicID => "Ip",
            GetFunctionCallConv => "Ip",
            SetFunctionCallConv => "vpi",
            GetGC => "tp",
            SetGC => "vpt",
            AddFunctionAttr => "vpi",
            GetFunctionAttr => "Ip",
            RemoveFunctionAttr => "vpi",

#/* Operations on parameters */
            CountParams => "Ip",
            GetParams => "vpp",
            GetParam => "ppi",
            GetParamParent => "pp",
            GetFirstParam => "pp",
            GetLastParam => "pp",
            GetNextParam => "pp",
            GetPreviousParam => "pp",
            AddAttribute => "vpi",
            RemoveAttribute => "vpi",
            GetAttribute => "Ip",
            SetParamAlignment => "vpi",

#/* Operations on basic blocks */
            BasicBlockAsValue => "pp",
            ValueIsBasicBlock => "Ip",
            ValueAsBasicBlock => "pp",
            GetBasicBlockParent => "pp",
            CountBasicBlocks => "Ip",
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
            GetInstructionCallConv => "Ip",
            AddInstrAttribute => "vpii",
            RemoveInstrAttribute => "vpii",
            SetInstrParamAlignment => "vpii",

#/* Operations on call instructions (only) */
            IsTailCall => "Ip",
            SetTailCall => "vpi",

#/* Operations on phi nodes */
            AddIncoming => "vpppi",
            CountIncoming => "Ip",
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
            RunPassManager => "Ipp",

# Initializes all of the function passes scheduled in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doInitialization. */
            InitializeFunctionPassManager => "Ip",

# Executes all of the function passes scheduled in the function pass manager
# on the provided function. Returns 1 if any of the passes modified the
# function, false otherwise.
# See llvm::FunctionPassManager::run(Function&). */
            RunFunctionPassManager => "Ipp",

# Finalizes all of the function passes scheduled in in the function pass
# manager. Returns 1 if any of the passes modified the module, 0 otherwise.
# See llvm::FunctionPassManager::doFinalization. */
            FinalizeFunctionPassManager => "Ip",

# Frees the memory of a pass pipeline. For function pipelines, does not free
# the module provider.
# See llvm::PassManagerBase::~PassManagerBase. */
            DisposePassManager => "vp",

        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, "LLVM" ~ $name, $signature);
        }
    }
}

# vim: ft=perl6
