#! nqp
=begin Description
LLVM Module.
=end Description


class LLVM::Module {
    has $!ref;

    method BUILD($name) {
        $!ref := %LLVM::F<LLVMModuleCreateWithName>($name);
        self;
    }

    method dump() {
        %LLVM::F<LLVMDumpModule>($!ref);
    }

    method _get_ptr() { $!ref };
};

# vim: ft=perl6
