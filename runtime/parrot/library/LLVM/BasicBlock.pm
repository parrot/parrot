class LLVM::BasicBlock is LLVM::Value {

    method next () {
        LLVM::BasicBlock.create(
            LLVM::call("GetNextBasicBlock", self)
        );
    }

    method prev () {
        LLVM::BasicBlock.create(
            LLVM::call("GetPreviousBasicBlock", self)
        );
    }

    method parent () {
        LLVM::BasicBlock.create(
            LLVM::call("GetBasicBlockParent", self)
        );
    }

    method as_value() {
        LLVM::Value.create(
            LLVM::call("BasicBlockAsValue", self)
        );
    }

    method insert_before($name) {
        LLVM::BasicBlock.create(
            LLVM::call("InsertBasicBlock", self, $name)
        );
    }

    method delete() {
        LLVM::BasicBlock.create(
            LLVM::call("DeleteBasicBlock", self)
        );
    }

    method first_instruction() {
        LLVM::Value.create(
            LLVM::call("GetFirstInstruction", self)
        );
    }

    method last_instruction() {
        LLVM::Value.create(
            LLVM::call("GetLastInstruction", self)
        );
    }
};

# vim: ft=perl6
