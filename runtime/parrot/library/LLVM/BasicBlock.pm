class LLVM::BasicBlock is LLVM::Value {
    method next () {
        LLVM::BasicBlock.create(
            LLVM::call("GetNextBasicBlock), self)
        );
    }
};

# vim: ft=perl6
