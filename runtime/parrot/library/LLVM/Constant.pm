module LLVM::Constant {

    sub null($type) {
        %LLVM::F<ConstNull>($type);
    }

    sub string($str) {
        %LLVM::F<ConstString>(~$str, pir::length($str), 0);
    }

    sub integer($int, $radix?) {
        %LLVM::F<ConstInt>(LLVM::Type::int($radix // 32), +$int, 1);
    }
};

# vim: ft=perl6
