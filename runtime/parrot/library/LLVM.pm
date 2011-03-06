module LLVM {
    our %F;

    INIT {
        pir::load_bytecode("nqp-setting.pbc");

        my $lib   := pir::loadlib("/usr/lib/libLLVM-2.7.so.1");
        my %funcs := hash(
            LLVMModuleCreateWithName    => "pt",
            LLVMDumpModule              => "vp",


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

