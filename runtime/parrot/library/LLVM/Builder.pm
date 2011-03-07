class LLVM::Builder is LLVM::Opaque {

    multi method BUILD () {
        self.wrap( %LLVM::F<LLVMCreateBuilder>() );
    }

    multi method BUILD ($context) {
        self.wrap( %LLVM::F<LLVMCreateBuilderInContext>($context) );
    }

    method DESTROY () {
        %LLVM::F<LLVMDisposeBuilder>(self);
    }

#            LLVMPositionBuilder             => "vppp",
    multi method set_position(LLVM::BasicBlock $bb, $value) {
        %LLVM::F<LLVMPositionBuilder>(self, $bb, $value);
    }

#            LLVMPositionBuilderBefore       => "vpp",
    multi method set_position($value) {
        %LLVM::F<LLVMPositionBuilderBefore>(self, $value);
    }

#            LLVMPositionBuilderAtEnd        => "vpp",
    multi method set_position(LLVM::BasicBlock $bb) {
        %LLVM::F<LLVMPositionBuilderAtEnd>(self, $bb);
    }

#            LLVMGetInsertBlock              => "pp",
#            LLVMClearInsertionPosition      => "vp",
#            LLVMInsertIntoBuilder           => "vpp",
#            LLVMInsertIntoBuilderWithName   => "vppt",
#            LLVMDisposeBuilder              => "vp",

#            # Terminators
#            LLVMBuildRetVoid                => "pp",
    multi method ret() {
        %LLVM::F<LLVMBuildRetVoid>(self);
    }

#            LLVMBuildRet                    => "ppp",
    multi method ret($value) {
        %LLVM::F<LLVMBuildRet>(self, $value);
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

#            # Arithmetic
#            LLVMBuildAdd        => "ppppt",
#            LLVMBuildNSWAdd     => "ppppt",
#            LLVMBuildFAdd       => "ppppt",
#            LLVMBuildSub        => "ppppt",
#            LLVMBuildFSub       => "ppppt",
#            LLVMBuildMul        => "ppppt",
#            LLVMBuildFMul       => "ppppt",
#            LLVMBuildUDiv       => "ppppt",
#            LLVMBuildSDiv       => "ppppt",
#            LLVMBuildExactSDiv  => "ppppt",
#            LLVMBuildFDiv       => "ppppt",
#            LLVMBuildURem       => "ppppt",
#            LLVMBuildSRem       => "ppppt",
#            LLVMBuildFRem       => "ppppt",
#            LLVMBuildShl        => "ppppt",
#            LLVMBuildLShr       => "ppppt",
#            LLVMBuildAShr       => "ppppt",
#            LLVMBuildAnd        => "ppppt",
#            LLVMBuildOr         => "ppppt",
#            LLVMBuildXor        => "ppppt",

#            LLVMBuildNeg => "pppt",
#            LLVMBuildNot => "pppt",

#            # Memory
#            LLVMBuildMalloc             => "pppt",
#            LLVMBuildArrayMalloc        => "ppppt",
#            LLVMBuildAlloca             => "pppt",
#            LLVMBuildArrayAlloca        => "ppppt",
#            LLVMBuildFree               => "ppp",
#            LLVMBuildLoad               => "pppt",
#            LLVMBuildStore              => "pppp",
#            LLVMBuildGEP                => "pppp3t", # FIXME It's array here.
#            LLVMBuildInBoundsGEP        => "pppp3t", # FIXME
#            LLVMBuildStructGEP          => "ppp3t",
#            LLVMBuildGlobalString       => "pptt",
    method global_string($value, $name) {
        %LLVM::F<LLVMBuildGlobalString>(self, $value, $name);
    }
#            LLVMBuildGlobalStringPtr    => "pptt",

#            # Casts
#            LLVMBuildTrunc => "ppppt",
#            LLVMBuildZExt => "ppppt",
#            LLVMBuildSExt => "ppppt",
#            LLVMBuildFPToUI => "ppppt",
#            LLVMBuildFPToSI => "ppppt",
#            LLVMBuildUIToFP => "ppppt",
#            LLVMBuildSIToFP => "ppppt",
#            LLVMBuildFPTrunc => "ppppt",
#            LLVMBuildFPExt => "ppppt",
#            LLVMBuildPtrToInt => "ppppt",
#            LLVMBuildIntToPtr => "ppppt",
#            LLVMBuildBitCast => "ppppt",
#            LLVMBuildZExtOrBitCast => "ppppt",
#            LLVMBuildSExtOrBitCast => "ppppt",
#            LLVMBuildTruncOrBitCast => "ppppt",
#            LLVMBuildPointerCast => "ppppt",
#            LLVMBuildIntCast => "ppppt",
#            LLVMBuildFPCast => "ppppt",

#            # Comparisons
#            LLVMBuildICmp => "pp3ppt",
#            LLVMBuildFCmp => "pp3ppt",

#            # Miscellaneous instructions
#            LLVMBuildPhi => "pppt",
#            LLVMBuildCall => "pppp3t", #FIXME

    method call($func, *@args, :$name?) {
        %LLVM::F<LLVMBuildCall>(
            self,
            $func,
            LLVM::convert_to_struct(@args),
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

};

# vim: ft=perl6
