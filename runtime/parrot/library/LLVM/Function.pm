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

};

# vim: ft=perl6
