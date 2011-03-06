class LLVM::Builder {
    has $!ref;

    method BUILD () {
        $!ref := %LLVM::F<LLVMCreateBuilder>();
    }


};

# vim: ft=perl6
