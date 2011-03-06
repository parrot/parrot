class LLVM::Function {
    our $counter;
    has $!ptr;

    method BUILD($ptr) { $!ptr := $ptr; self };

    method append_basic_block($name?) {
        LLVM::BasicBlock.new.BUILD(
            %LLVM::F<LLVMAppendBasicBlock>($!ptr, $name ?? $name !! "block" ~~ $counter++)
        );
    }

    method set_linkage($linkage) {
        %LLVM::F<LLVMSetLinkage>($!ptr, $linkage);
    }

    method _get_ptr() { $!ptr };
};

# vim: ft=perl6
