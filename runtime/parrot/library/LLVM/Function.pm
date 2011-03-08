class LLVM::Function is LLVM::Opaque {
    method entry_block() {
        LLVM::BasicBlock.create(
            %LLVM::F<GetEntryBasicBlock>(self)
        );
    }

    method append_basic_block($name?) {
        LLVM::BasicBlock.create(
            %LLVM::F<AppendBasicBlock>(self, $name // "")
        );
    }

    method set_linkage($linkage) {
        %LLVM::F<SetLinkage>(self, $linkage);
    }


    =item *
    CountParams => "ip",

    method params_count() {
        %LLVM::F<CountParams>(self);
    }

    =item *
    GetParams => "vpp",

    =item *
    GetParam => "ppi",

    method param($idx) {
        LLVM::Value.create(%LLVM::F<GetParam>(self, $idx));
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
