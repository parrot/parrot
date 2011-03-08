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
};

# vim: ft=perl6
