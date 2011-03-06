class LLVM::BasicBlock {
    has $!ref;

    method BUILD($ref) { $!ref := $ref; self };

    method _get_ptr() { $!ref };
};

# vim: ft=perl6
