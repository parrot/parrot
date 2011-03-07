class LLVM::BasicBlock is LLVM::Opaque {
    method BUILD($ref) { self.wrap($ptr) };
};

# vim: ft=perl6
