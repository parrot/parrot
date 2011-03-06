class LLVM::BasicBlock {
    has $!ref;

    method BUILD($ref) { $!ref := $ref; self };


};

# vim: ft=perl6
