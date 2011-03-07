class LLVM::Opaque {
    has $!ptr;

    method wrap($ptr) { $!ptr := $ptr; self };
    method unwrap()   { $!ptr };
};

# vim: ft=perl6
