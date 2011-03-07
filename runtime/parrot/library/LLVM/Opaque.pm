class LLVM::Opaque {
    has $!ptr;

    # Default implementation of BUILD/new
    method BUILD($ptr) { self.wrap($ptr) }

    #multi method new()     { self }
    #multi method new($ptr) { self.wrap($ptr) }

    method wrap($ptr) { $!ptr := $ptr; self };
    method unwrap()   { $!ptr };
};

# vim: ft=perl6
