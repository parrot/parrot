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

    method add_function ($name, $signature) {
        # FIXME. Total hack for now.
        my $type := %LLVM::F<LLVMFunctionType>(
            LLVM::Type::void(), # return
            undef,              # parameters
            0,                  # number of parameters
            0,                  # is var args
        );

        %LLVM::F<LLVMAddFunction>($!ref, $name, $type);
    }

    method _get_ptr() { $!ref };
};

# vim: ft=perl6
