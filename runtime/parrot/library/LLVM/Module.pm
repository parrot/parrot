#! nqp
=begin Description
LLVM Module.
=end Description


class LLVM::Module is LLVM::Opaque {
    method BUILD($name) {
        self.wrap( %LLVM::F<LLVMModuleCreateWithName>($name) );
    }

    method dump() {
        %LLVM::F<LLVMDumpModule>(self);
    }

    method add_function ($name, $return, *@args, :$va_args?) {
        my $type := %LLVM::F<LLVMFunctionType>(
            $return,                        # return
            LLVM::convert_to_struct(@args), # parameters
            +@args,                         # number of parameters
            +$va_args,                      # is var args
        );

        LLVM::Function.new.BUILD(%LLVM::F<LLVMAddFunction>(self, $name, $type));
    }

#/** See Module::addTypeName. */
    # LLVMAddTypeName => "Iptp",
    method add_type_name(Str $name, $type) {
        %LLVM::F<LLVMAddTypeName>(self, $name, $type);
    }

    # LLVMDeleteTypeName => "vpt",
    # LLVMGetTypeByName => "ppt",

};

# vim: ft=perl6
