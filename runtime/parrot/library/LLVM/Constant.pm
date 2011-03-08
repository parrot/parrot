module LLVM::Constant {

    sub null($type) {
        LLVM::call("ConstNull", $type);
    }

    sub string($str) {
        LLVM::call("ConstString", ~$str, pir::length($str), 0);
    }

    sub integer($int, $radix?) {
        LLVM::call("ConstInt", LLVM::Type::int($radix // 32), +$int, 1);
    }
};

# vim: ft=perl6
