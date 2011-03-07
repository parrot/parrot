class LLVM::Function is LLVM::Opaque {
    our $counter;

    method append_basic_block($name?) {
        LLVM::BasicBlock.new.BUILD(
            %LLVM::F<AppendBasicBlock>($!ptr, $name ?? $name !! "block" ~~ $counter++)
        );
    }

    method set_linkage($linkage) {
        %LLVM::F<SetLinkage>($!ptr, $linkage);
    }
};

# vim: ft=perl6
