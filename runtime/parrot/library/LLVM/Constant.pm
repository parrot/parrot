module LLVM::Constant {

    sub null($type) {
        %LLVM::F<LLVMConstNull>($type);
    }

    sub string($str) {
        %LLVM::F<LLVMConstString>(~$str, pir::length($str), 0);
    }

    sub integer($int) {
        %LLVM::F<LLVMConstInt>(LLVM::Type::int8(), +$int, 1);
    }
};

# vim: ft=perl6
