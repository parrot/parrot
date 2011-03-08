#! nqp
=begin Description
LLVM Module.
=end Description


class LLVM::Module is LLVM::Opaque {
    multi method create($name) {
        self.new.wrap( %LLVM::F<ModuleCreateWithName>($name) );
    }

    method dump() {
        %LLVM::F<DumpModule>(self);
    }

    method add_function ($name, $return, *@args, :$va_args?) {
        my $type := %LLVM::F<FunctionType>(
            $return,                        # return
            LLVM::to_array(@args),          # parameters
            +@args,                         # number of parameters
            +$va_args,                      # is var args
        );

        LLVM::Function.create(%LLVM::F<AddFunction>(self, $name, $type));
    }

#/** See Module::addTypeName. */
    # LLVMAddTypeName => "Iptp",
    method add_type_name(Str $name, $type) {
        %LLVM::F<AddTypeName>(self, $name, $type);
    }

    # LLVMDeleteTypeName => "vpt",
    method delete_type_name(Str $name) {
        %LLVM::F<DeleteTypeName>(self, $name);
    }

    # LLVMGetTypeByName => "ppt",
    method get_type_name(Str $name) {
        %LLVM::F<GetTypeByName>(self, $name);
    }
};

# vim: ft=perl6
