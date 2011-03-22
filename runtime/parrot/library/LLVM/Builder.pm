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
    method insert_into_builder(LLVM::Value $val) {
        LLVM::BasicBlock.create(
            LLVM::call("InsertIntoBuilder", self, $val)
        );
    }

#            LLVMInsertIntoBuilderWithName   => "vppt",
    method insert_into_builder_with_name(LLVM::Value $val, Str $name?) {
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
    method aggregate_ret(LLVM::Value *@vals) {
        my $vals_llvm := LLVM::to_array(@vals);
        LLVM::Value.create(
            LLVM::call("BuildAggregateRet", self, $vals_llvm, +@vals)
        );
    }

#            LLVMBuildBr                     => "ppp",
    method br(LLVM::BasicBlock $to) {
        LLVM::Value.create(
            LLVM::call("BuildBr", self, $to)
        );
    }

#            LLVMBuildCondBr                 => "ppppp",
    method cond_br(LLVM::Value $if, LLVM::BasicBlock $then, LLVM::BasicBlock $else) {
        LLVM::Value::create(
            LLVM::call("BuildCondBr", self, $if, $then, $else)
        );
    }

#            LLVMBuildSwitch                 => "ppppi",
    method switch(LLVM::Value $v, LLVM::BasicBlock $else, Int $num_cases) {
        LLVM::Value::create(
            LLVM::call("BuildSwitch", self, $v, $else, $num_cases)
        );
    }

#            LLVMBuildInvoke                 => "ppppippt",
    method invoke(LLVM::Function $func, *@args, LLVM::BasicBlock $then, LLVM::BasicBlock $catch, Str :$name?) {
        my $args_llvm := LLVM::to_array(@args);
        LLVM::Value.create(
            LLVM::call("BuildInvoke", self, $func, $args_llvm, +@args, $then, $catch, $name)
        );
    }

#            LLVMBuildUnwind                 => "pp",
    method unwind(){
         LLVM::Value::create(
            LLVM::call("BuildUnwind", self)
        );
    }

#            LLVMBuildUnreachable            => "pp",
    method unreachable(){
         LLVM::Value::create(
            LLVM::call("BuildUnreachable", self)
        );
    }

#            # Add a case to the switch instruction */
#            LLVMAddCase => "vppp",
    method add_case(LLVM::Value $switch, LLVM::Value $val, LLVM::BasicBlock $dest) {
        LLVM::Value::create(
            LLVM::call("BuildAddCase", $switch, $val, $dest)
        )
    }

#            # Arithmetic is generated in INIT block.

#            LLVMBuildNeg => "pppt",
    method neg(LLVM::Value $v, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildNeg", self, $v, $name)
        );
    }

#            LLVMBuildNot => "pppt",
    method not(LLVM::Value $v, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildNot", self, $v, $name)
        );
    }

#            # Memory
#            LLVMBuildMalloc             => "pppt",
    method malloc(LLVM::Type $type, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildMalloc", self, $type, $name)
        );
    }

#            LLVMBuildArrayMalloc        => "ppppt",
    method array_malloc(LLVM::Type $type, LLVM::Value $n, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildArrayMalloc", self, $type, $n, $name)
        );
    }

#            LLVMBuildAlloca             => "pppt",
    method alloca(LLVM::Type $type, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildAlloca", self, $type, $name)
        );
    }
#            LLVMBuildArrayAlloca        => "ppppt",
    method array_alloca(LLVM::Type $type, LLVM::Value $n, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildArrayAlloca", self, $type, $n, $name)
        );
    }
#            LLVMBuildFree               => "ppp",
    method free(LLVM::Value $ptr) {
        LLVM::Value.create(
            LLVM::call("BuildFree", self, $ptr)
        );
    }

#            LLVMBuildLoad               => "pppt",
    method load(LLVM::Value $ptr, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildLoad", self, $ptr, $name)
        );
    }
#            LLVMBuildStore              => "pppp",
    method store(LLVM::Value $value, LLVM::Value $ptr) {
        LLVM::Value.create(
            LLVM::call("BuildStore", self, $value, $ptr)
        );
    }

#            LLVMBuildGEP                => "ppppit",
    method gep(LLVM::Type $type, *@indices, Str :$name?) {
        my $args := LLVM::to_array(@indices);
        LLVM::Value.create(
            LLVM::call("BuildGEP", self, $type, $args, +@indices, $name // "")
        );
    }

#            LLVMBuildStructGEP          => "ppppt",
    method struct_gep(LLVM::Type $ptr, Int $idx, Str $name?) {
        LLVM::Value.create(
            LLVM::call("BuildStructGEP", self, $ptr, $idx, $name)
        );
    }

#            LLVMBuildInBoundsGEP        => "ppppit",
    method inbounds_gep(LLVM::Type $type, *@indices, :$name?) {
        my $args := LLVM::to_array(@indices);
        LLVM::Value.create(
            LLVM::call("BuildInBoundsGEP", self, $type, $args, +@indices, $name // "")
        );
    }

#            LLVMBuildGlobalString       => "pptt",
    method global_string(Str $value, Str :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalString", self, $value, $name)
        );
    }
#            LLVMBuildGlobalStringPtr    => "pptt",
    method global_string_ptr(Str $value, Str :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildGlobalStringPtr", self, $value, $name)
        );
    }

            # Casts are generated

#            # Comparisons
#            LLVMBuildICmp => "ppippt",
    method icmp(Int $op, LLVM::Value $left, LLVM::Value $right, Str :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildICmp", $op, $left, $right, $name)
        )
    }

#            LLVMBuildFCmp => "ppippt",
    method fcmp(Int $op, LLVM::Value $left, LLVM::Value $right, Str :$name?) {
        LLVM::Value.create(
            LLVM::call("BuildFCmp", $op, $left, $right, $name)
        )
    }

#            # Miscellaneous instructions
#            LLVMBuildPhi => "pppt",
    method phi(LLVM::Type $type, Str $name?){
        LLVM::Value.create(
            LLVM::call("BuildFhi", self, $type, $name)
        )
    }

#            LLVMBuildCall => "pppppt",
    method call(LLVM::Function $func, *@args, Str :$name?) {
        LLVM::call("BuildCall",
            self,
            $func,
            LLVM::to_array(@args),
            +@args,
            $name // ""
        );
    }
#            LLVMBuildSelect => "pppppt",
    method select(LLVM::Value $if, LLVM::BasicBlock $then, LLVM::BasicBlock $else, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildSelect", self, $if, $then, $else, $name)
        );
    }

#            LLVMBuildVAArg => "ppppt",
    method va_arg(LLVM::Value $list, LLVM::Type $type, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildVAARG", self, $list, $type, $name)
        );
    }

#            LLVMBuildExtractElement => "ppppt",
    method extract_element(LLVM::Value $vector, LLVM::Value $index, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildExtractElement", self, $vector, $index, $name)
        );
    }
    
#            LLVMBuildInsertElement => "pppppt",
    method insert_element(LLVM::Value $vector, LLVM::Value $val, LLVM::Value $index, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildInsertElement", self, $vector, $val, $index, $name)
        );
    }

#            LLVMBuildShuffleVector => "pppppt",
    method shuffle_vector(LLVM::Value $v1, LLVM::Value $v2, LLVM::Value $mask, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildShuffleVector", self, $v1, $v2, $mask, $name)
        );
    }

#            LLVMBuildExtractValue => "ppp3t",
    method extract_value(LLVM::Value $aggr, Int $index, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildExtractValue", self, $aggr, $index, $name)
        );
    }

#            LLVMBuildInsertValue => "pppp3t",
    method insert_value(LLVM::Value $aggr, LLVM::Value $val, Int $index, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildInsertValue", self, $aggr, $val, $index, $name)
        );
    }

#            LLVMBuildIsNull => "pppt",
    method is_null(LLVM::Value $val, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildIsNull", self, $val, $name)
        );
    }

#            LLVMBuildIsNotNull => "pppt",
    method is_not_null(LLVM::Value $val, Str $name?) {
        LLVM::Value::create(
            LLVM::call("BuildIsNotNull", self, $val, $name)
        );
    }
#            LLVMBuildPtrDiff => "ppppt",
    method ptr_diff(LLVM::Value $ptr1, LLVM::Value $ptr2, Str $name?) {
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
            method (LLVM::Value $left, LLVM::Value $right, Str :$name?) {
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
            method (LLVM::Value $value, LLVM::Type $type, Str :$name?) {
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
