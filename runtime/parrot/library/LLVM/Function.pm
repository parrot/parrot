class LLVM::Function is LLVM::Opaque {
    our $counter;

    method BUILD($ptr) { self.wrap($ptr) };

    method append_basic_block($name?) {
        LLVM::BasicBlock.new.BUILD(
            %LLVM::F<LLVMAppendBasicBlock>($!ptr, $name ?? $name !! "block" ~~ $counter++)
        );
    }

    method set_linkage($linkage) {
        %LLVM::F<LLVMSetLinkage>($!ptr, $linkage);
    }
};

# vim: ft=perl6
