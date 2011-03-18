class LLVM::Opaque {
    has $!ptr;

    # Default implementation of BUILD/new
    #method BUILD($ptr) { self.wrap($ptr) }

    # This is workaround of absense of BUILD submethods in NQP
    multi method create($ptr) { self.WHAT.new.wrap($ptr) }

    method wrap($ptr) { $!ptr := $ptr; self };
    method unwrap()   { $!ptr };

    method defined() is pirflags<:vtable('get_bool')> {
        pir::defined($!ptr);
    }

    multi method ACCEPTS($lhs) {
        0;
    }

    # Check that two objects wrap same LLVM ref.
    multi method ACCEPTS(LLVM::Opaque $lhs) {
        pir::get_addr__ip(self.unwrap) == pir::get_addr__ip($lhs.unwrap);
    }
};

# vim: ft=perl6
