module LLVM::Constant {

    sub null($type) {
        LLVM::Value.create(LLVM::call("ConstNull", $type));
    }

    sub all_ones($type) {
        LLVM::Value.create(LLVM::call("ConstAllOnes", $type));
    }

    sub undef($type) {
        LLVM::Value.create(LLVM::call("GetUndef", $type));
    }

    sub pointer_null($type) {
        LLVM::Value.create(LLVM::call("ConstPointerNull", $type));
    }

    sub string($str) {
        LLVM::Value.create(LLVM::call("ConstString", ~$str, pir::length($str), 0));
    }

    sub integer($int, $radix?) {
        LLVM::Value.create(LLVM::call("ConstInt", LLVM::Type::int($radix // 32), +$int, 1));
    }

    sub real($double) {
        LLVM::Value.create(LLVM::call("ConstReal", LLVM::Type::double(), +$double));

    }
};

# vim: ft=perl6
