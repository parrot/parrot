class LLVM::Function is LLVM::Value {
    method entry_block() {
        LLVM::BasicBlock.create(
            LLVM::call("GetEntryBasicBlock", self)
        );
    }

    method append_basic_block($name?) {
        LLVM::BasicBlock.create(
            LLVM::call("AppendBasicBlock", self, $name // "")
        );
    }

    method set_linkage($linkage) {
        LLVM::call("SetLinkage", self, $linkage);
    }


    =item *
    CountParams => "ip",

    method params_count() {
        LLVM::call("CountParams", self);
    }

    =item *
    GetParams => "vpp",

    =item *
    GetParam => "ppi",

    method param($idx) {
        LLVM::Value.create(LLVM::call("GetParam", self, $idx));
    }

    =item *
    GetParamParent => "pp",

    =item *
    GetFirstParam => "pp",

    =item *
    GetLastParam => "pp",

    =item *
    GetNextParam => "pp",

    =item *
    GetPreviousParam => "pp",

    =item *
    AddAttribute => "vpi",

    =item *
    RemoveAttribute => "vpi",

    =item *
    GetAttribute => "ip",

    =item *
    SetParamAlignment => "vpi",

    =item *
    GetReturnType => "pp",

    method return_type() {
        LLVM::Type.create(
            LLVM::call("GetReturnType", self)
        );
    }

    method next() {
        LLVM::Function.create(
            LLVM::call("GetNextFunction", self)
        );
    }

    method prev() {
        LLVM::Function.create(
            LLVM::call("GetPreviousFunction", self)
        );
    }

    method entry_basic_block () {
        LLVM::BasicBlock.create(
            LLVM::call("GetEntryBasicBlock", self)
        );
    }

    method first_basic_block () {
        LLVM::BasicBlock.create(
            LLVM::call("GetFirstBasicBlock", self)
        );
    }

    method last_basic_block () {
        LLVM::BasicBlock.create(
            LLVM::call("GetLastBasicBlock", self)
        );
    }
};

# vim: ft=perl6
