module LLVM::Constant {

    sub null($type) {
        %LLVM::F<LLVMConstNull>($type);
    }

    sub string($str) {
        %LLVM::F<LLVMConstString>(~$str, pir::length($str), 0);
    }

};

# vim: ft=perl6
