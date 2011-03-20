module LLVM::Constant {

    sub null(LLVM::Type $type) {
        LLVM::Value.create(LLVM::call("ConstNull", $type));
    }

    sub all_ones(LLVM::Type $type) {
        LLVM::Value.create(LLVM::call("ConstAllOnes", $type));
    }

    sub undef(LLVM::Type $type) {
        LLVM::Value.create(LLVM::call("GetUndef", $type));
    }

    sub pointer_null(LLVM::Type $type) {
        LLVM::Value.create(LLVM::call("ConstPointerNull", $type));
    }

    sub string(LLVM::Type $str) {
        LLVM::Value.create(LLVM::call("ConstString", ~$str, pir::length($str), 0));
    }

    sub integer(LLVM::Type $int, $radix?) {
        LLVM::Value.create(LLVM::call("ConstInt", LLVM::Type::int($radix // 32), +$int, 1));
    }

    sub real(LLVM::Type $double) {
        LLVM::Value.create(LLVM::call("ConstReal", LLVM::Type::double(), +$double));

    }
};

# vim: ft=perl6
