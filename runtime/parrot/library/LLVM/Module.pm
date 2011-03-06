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

    method add_function ($name, $return, *@args, :$va_args?) {
        my $type := %LLVM::F<LLVMFunctionType>(
            $return,                        # return
            LLVM::convert_to_struct(@args), # parameters
            +@args,                         # number of parameters
            +$va_args,                      # is var args
        );

        LLVM::Function.new.BUILD(%LLVM::F<LLVMAddFunction>($!ref, $name, $type));
    }

    method _get_ptr() { $!ref };
};

# vim: ft=perl6
