class LLVM::Builder is LLVM::Opaque {

    multi method create () {
        self.new.wrap( LLVM::call("CreateBuilder", ) );
    }

    multi method create ($context) {
        self.new.wrap( LLVM::call("CreateBuilderInContext", $context) );
    }

    method DESTROY () {
        LLVM::call("DisposeBuilder", self);
        self.wrap(undef);
    }

#            LLVMPositionBuilder             => "vppp",
    multi method set_position(LLVM::BasicBlock $bb, LLVM::Value $value) {
        LLVM::call("PositionBuilder", self, $bb, $value);
    }

#            LLVMPositionBuilderBefore       => "vpp",
    multi method set_position(LLVM::Value $value) {
        LLVM::call("PositionBuilderBefore", self, $value);
    }

#            LLVMPositionBuilderAtEnd        => "vpp",
    multi method set_position(LLVM::BasicBlock $bb) {
        LLVM::call("PositionBuilderAtEnd", self, $bb);
    }

#            LLVMGetInsertBlock              => "pp",
    method get_insert_block() {
        LLVM::BasicBlock.create(
            LLVM::call("GetInsertBlock", self)
        );
    }

#            LLVMClearInsertionPosition      => "vp",
    method clear_insert_position() {
        LLVM::BasicBlock.create(
            LLVM::call("ClearInsertPosition", self)
        );
    }

#            LLVMInsertIntoBuilder           => "vpp",
    multi method insert_into_builder(LLVM::Value $val) {
        LLVM::BasicBlock.create(
            LLVM::call("InsertIntoBuilder", self, $val)
        );
    }

#            LLVMInsertIntoBuilderWithName   => "vppt",
    multi method insert_into_builder_with_name(LLVM::Value $val, $name?) {
        LLVM::BasicBlock.create(
            LLVM::call("InsertIntoBuilderWithName", self, $val, $name)
        );
    }

#            # Terminators
#            LLVMBuildRetVoid                => "pp",
    multi method ret() {
        LLVM::Value.create(
            LLVM::call("BuildRetVoid", self)
        );
    }

#            LLVMBuildRet                    => "ppp",
    multi method ret(LLVM::Value $value) {
        LLVM::Value.create(
            LLVM::call("BuildRet", self, $value)
        );
    }

#            LLVMBuildAggregateRet           => "ppp3",
    multi method aggregate_ret(LLVM::Value *@vals) {
        LLVM::Value.create(
            LLVM::call("BuildAggregateRet", self, LLVM::to_array(@vals), +@vals)
        );
    }

#            LLVMBuildBr                     => "ppp",
    multi method br(LLVM::BasicBlock $to) {
        LLVM::Value.create(
            LLVM::call("BuildBr", self, $to)
        );
    }

#            LLVMBuildCondBr                 => "ppppp",
    multi method cond_br(LLVM::Value $if, LLVM::BasicBlock $then, LLVM::BasicBlock $else) {
        LLVM::Value::create(
            LLVM::call("BuildCondBr", self, $if, $then, $else)
        );
    }

#            LLVMBuildSwitch                 => "ppppi",
    multi method switch(LLVM::Value $v, LLVM::BasicBlock $else, $num_cases) {
        LLVM::Value::create(
            LLVM::call("BuildSwitch", self, $v, $else, $num_cases)
        );
    }

#            LLVMBuildInvoke                 => "ppppippt",
    multi method invoke(LLVM::Function $func, *@args, LLVM::BasicBlock $then, LLVM::BasicBlock $catch, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildInvoke", self, $func, LLVM::to_array(@args), +@args, $then, $catch, $name)
        );
    }

#            LLVMBuildUnwind                 => "pp",
    method unwind() {
         LLVM::Value::create(
            LLVM::call("BuildUnwind", self)
        );
    }

#            LLVMBuildUnreachable            => "pp",
    method unreachable() {
         LLVM::Value::create(
            LLVM::call("BuildUnreachable", self)
        );
    }

#            # Add a case to the switch instruction */
#            LLVMAddCase => "vppp",
    multi method add_case(LLVM::Value $switch, LLVM::Value $val, LLVM::BasicBlock $dest) {
        LLVM::Value::create(
            LLVM::call("BuildAddCase", $switch, $val, $dest)
        )
    }

#            # Arithmetic is generated in INIT block.

#            LLVMBuildNeg => "pppt",
    multi method neg(LLVM::Value $v, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildNeg", self, $v, $name)
        );
    }

#            LLVMBuildNot => "pppt",
    multi method not(LLVM::Value $v, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildNot", self, $v, $name)
        );
    }

#            # Memory
#            LLVMBuildMalloc             => "pppt",
    multi method malloc(LLVM::Type $type, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildMalloc", self, $type, $name)
        );
    }

#            LLVMBuildArrayMalloc        => "ppppt",
    multi method array_malloc(LLVM::Type $type, LLVM::Value $n, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildArrayMalloc", self, $type, $n, $name)
        );
    }

#            LLVMBuildAlloca             => "pppt",
    multi method alloca(LLVM::Type $type, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildAlloca", self, $type, $name)
        );
    }
#            LLVMBuildArrayAlloca        => "ppppt",
    multi method array_alloca(LLVM::Type $type, LLVM::Value $n, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildArrayAlloca", self, $type, $n, $name)
        );
    }
#            LLVMBuildFree               => "ppp",
    multi method free(LLVM::Value $ptr) {
        LLVM::Value.create(
            LLVM::call("BuildFree", self, $ptr)
        );
    }

#            LLVMBuildLoad               => "pppt",
    multi method load(LLVM::Value $ptr, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildLoad", self, $ptr, $name)
        );
    }
#            LLVMBuildStore              => "pppp",
    multi method store(LLVM::Value $value, LLVM::Value $ptr) {
        LLVM::Value.create(
            LLVM::call("BuildStore", self, $value, $ptr)
        );
    }

#            LLVMBuildGEP                => "ppppit",
    multi method gep(LLVM::Value $type, *@indices, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildGEP", self, $type, LLVM::to_array(@indices), +@indices, $name // "")
        );
    }

#            LLVMBuildStructGEP          => "ppppt",
    multi method struct_gep(LLVM::Value $ptr, $idx, $name?) {
        LLVM::Value.create(
            LLVM::call("BuildStructGEP", self, $ptr, $idx, $name)
        );
    }

#            LLVMBuildInBoundsGEP        => "ppppit",
    multi method inbounds_gep(LLVM::Value $ptr, *@indices, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildInBoundsGEP", self, $type, LLVM::to_array(@indices), +@indices, $name // "")
        );
    }

#            LLVMBuildGlobalString       => "pptt",
    multi method global_string($value, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalString", self, $value, $name)
        );
    }
#            LLVMBuildGlobalStringPtr    => "pptt",
    multi method global_string_ptr($value, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalStringPtr", self, $value, $name)
        );
    }

            # Casts are generated

#            # Comparisons
#            LLVMBuildICmp => "ppippt",
    multi method icmp($op, LLVM::Value $left, LLVM::Value $right, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildICmp", $op, $left, $right, $name)
        )
    }

#            LLVMBuildFCmp => "ppippt",
    multi method fcmp($op, LLVM::Value $left, LLVM::Value $right, :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildFCmp", $op, $left, $right, $name)
        )
    }

#            # Miscellaneous instructions
#            LLVMBuildPhi => "pppt",
    multi method phi(LLVM::Type $type, $name?){
        LLVM::Value.create(
            LLVM::call("BuildFhi", self, $type, $name)
        )
    }

#            LLVMBuildCall => "pppppt",
    multi method call(LLVM::Function $func, *@args, :$name?) {
        LLVM::call("BuildCall",
            self,
            $func,
            LLVM::to_array(@args),
            +@args,
            $name // ""
        );
    }
#            LLVMBuildSelect => "pppppt",
    multi method select(LLVM::Value $if, LLVM::BasicBlock $then, LLVM::BasicBlock $else, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildSelect", self, $if, $then, $else, $name)
        );
    }

#            LLVMBuildVAArg => "ppppt",
    multi method va_arg(LLVM::Value $list, LLVM::Type $type, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildVAARG", self, $list, $type, $name)
        );
    }

#            LLVMBuildExtractElement => "ppppt",
    multi method extract_element(LLVM::Value $vector, LLVM::Value $index, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildExtractElement", self, $vector, $index, $name)
        );
    }
    
#            LLVMBuildInsertElement => "pppppt",
    multi method insert_element(LLVM::Value $vector, LLVM::Value $val, LLVM::Value $index, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildInsertElement", self, $vector, $val, $index, $name)
        );
    }

#            LLVMBuildShuffleVector => "pppppt",
    multi method shuffle_vector(LLVM::Value $v1, LLVM::Value $v2, LLVM::Value $mask, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildShuffleVector", self, $v1, $v2, $mask, $name)
        );
    }

#            LLVMBuildExtractValue => "ppp3t",
    multi method extract_value(LLVM::Value $aggr, $index, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildExtractValue", self, $aggr, $index, $name)
        );
    }

#            LLVMBuildInsertValue => "pppp3t",
    multi method insert_value(LLVM::Value $aggr, LLVM::Value $val, $index, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildInsertValue", self, $aggr, $val, $index, $name)
        );
    }

#            LLVMBuildIsNull => "pppt",
    multi method is_null(LLVM::Value $val, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildIsNull", self, $val, $name)
        );
    }

#            LLVMBuildIsNotNull => "pppt",
    multi method is_not_null(LLVM::Value $val, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildIsNotNull", self, $val, $name)
        );
    }
#            LLVMBuildPtrDiff => "ppppt",
    multi method ptr_diff(LLVM::Value $ptr1, LLVM::Value $ptr2, $name?) {
        LLVM::Value::create(
            LLVM::call("BuildPtrDiff", self, $ptr1, $ptr2, $name)
        );
    }

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
