class LLVM::BasicBlock is LLVM::Value {
    method next () {
        LLVM::BasicBlock.create(
            LLVM::call("GetNextBasicBlock", self)
        );
    }


    method insert_before($name) {
        LLVM::BasicBlock.create(
            LLVM::call("InsertBasicBlock", self, $name)
        );
    }
};

# vim: ft=perl6
