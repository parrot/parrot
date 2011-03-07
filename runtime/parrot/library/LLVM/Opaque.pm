class LLVM::Opaque {
    has $!ptr;

    # Default implementation of BUILD.
    method BUILD($ptr) { self.wrap($ptr) }

    method wrap($ptr) { $!ptr := $ptr; self };
    method unwrap()   { $!ptr };
};

# vim: ft=perl6
