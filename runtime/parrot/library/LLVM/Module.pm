#! nqp
=begin Description
LLVM Module.
=end Description


class LLVM::Module is LLVM::Opaque {
    method BUILD($name) {
        self.wrap( %LLVM::F<ModuleCreateWithName>($name) );
    }

    method dump() {
        %LLVM::F<DumpModule>(self);
    }

    method add_function ($name, $return, *@args, :$va_args?) {
        my $type := %LLVM::F<FunctionType>(
            $return,                        # return
            LLVM::convert_to_struct(@args), # parameters
            +@args,                         # number of parameters
            +$va_args,                      # is var args
        );

        LLVM::Function.new.BUILD(%LLVM::F<AddFunction>(self, $name, $type));
    }

#/** See Module::addTypeName. */
    # LLVMAddTypeName => "Iptp",
    method add_type_name(Str $name, $type) {
        %LLVM::F<AddTypeName>(self, $name, $type);
    }

    # LLVMDeleteTypeName => "vpt",
    # LLVMGetTypeByName => "ppt",
};

# vim: ft=perl6
