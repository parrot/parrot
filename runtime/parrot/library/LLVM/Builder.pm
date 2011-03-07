class LLVM::Builder is LLVM::Opaque {

    multi method BUILD () {
        self.wrap( %LLVM::F<CreateBuilder>() );
    }

    multi method BUILD ($context) {
        self.wrap( %LLVM::F<CreateBuilderInContext>($context) );
    }

    method DESTROY () {
        %LLVM::F<DisposeBuilder>(self);
    }

#            LLVMPositionBuilder             => "vppp",
    multi method set_position(LLVM::BasicBlock $bb, $value) {
        %LLVM::F<PositionBuilder>(self, $bb, $value);
    }

#            LLVMPositionBuilderBefore       => "vpp",
    multi method set_position($value) {
        %LLVM::F<PositionBuilderBefore>(self, $value);
    }

#            LLVMPositionBuilderAtEnd        => "vpp",
    multi method set_position(LLVM::BasicBlock $bb) {
        %LLVM::F<PositionBuilderAtEnd>(self, $bb);
    }

#            LLVMGetInsertBlock              => "pp",
#            LLVMClearInsertionPosition      => "vp",
#            LLVMInsertIntoBuilder           => "vpp",
#            LLVMInsertIntoBuilderWithName   => "vppt",
#            LLVMDisposeBuilder              => "vp",

#            # Terminators
#            LLVMBuildRetVoid                => "pp",
    multi method ret() {
        %LLVM::F<BuildRetVoid>(self);
    }

#            LLVMBuildRet                    => "ppp",
    multi method ret($value) {
        %LLVM::F<BuildRet>(self, $value);
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
    method alloca($type, $name?) {
        %LLVM::F<BuildAlloca>(self, $type, $name);
    }
#            LLVMBuildArrayAlloca        => "ppppt",
#            LLVMBuildFree               => "ppp",
#            LLVMBuildLoad               => "pppt",
    method load($ptr, $name?) {
        %LLVM::F<BuildLoad>(self, $ptr, $name);
    }
#            LLVMBuildStore              => "pppp",
    method store($value, $ptr) {
        %LLVM::F<BuildStore>(self, $value, $ptr);
    }

#            LLVMBuildGEP                => "ppppit",
    method gep($type, *@indices, :$name?) {
        pir::say("# { +@indices }");
        pir::say("# $name");
        my $args := LLVM::convert_to_struct(@indices);
        pir::say("# FOO");
        my $r := %LLVM::F<BuildGEP>(self, $type, $args, +@indices, $name // "");
        pir::say("# BANG");
        $r;
    }

#            LLVMBuildStructGEP          => "ppp3t",
#            LLVMBuildInBoundsGEP        => "ppppit",
    method inbounds_gep($type, *@indices, :$name?) {
        pir::say("# { +@indices }");
        pir::say("# $name");
        my $args := LLVM::convert_to_struct(@indices);
        pir::say("# FOO");
        my $r := %LLVM::F<BuildInBoundsGEP>(self, $type, $args, +@indices, $name // "");
        pir::say("# BANG");
        $r;
    }

#            LLVMBuildStructGEP          => "ppp3t",
    method struct_gep($ptr, Int $idx, Str $name?) {
        %LLVM::F<BuildStructGEP>(self, $ptr, $idx, $name);
    }

#            LLVMBuildGlobalString       => "pptt",
    method global_string($value, $name) {
        %LLVM::F<BuildGlobalString>(self, $value, $name);
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
        %LLVM::F<BuildCall>(
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
