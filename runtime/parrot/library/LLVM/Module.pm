#! nqp
#=begin Description
#LLVM Module.
#=end Description


class LLVM::Module is LLVM::Opaque {
    multi method create($name) {
        self.new.wrap( LLVM::call("ModuleCreateWithName", $name) );
    }

    method verify($action?) {
        0 == LLVM::call(
            "VerifyModule",
            self,
            $action // LLVM::VERIFYER_FAILURE_ACTION.RETURN_STATUS,
            ""
        );
    }

    method dump() {
        LLVM::call("DumpModule", self);
    }

    method add_function ($name, $return, *@args, :$va_args?) {
        LLVM::Function.create(
            LLVM::call("AddFunction", self, $name,
                LLVM::Type::function($return, |@args, :va_args($va_args))
            )
        );
    }

    method first_function() {
        LLVM::Function.create(
            LLVM::call("GetFirstFunction", self)
        );
    }

    method last_function() {
        LLVM::Function.create(
            LLVM::call("GetLastFunction", self)
        );
    }


#/** See Module::addTypeName. */
    # LLVMAddTypeName => "Iptp",
    method add_type(Str $name, LLVM::Type $type) {
        # Reverse response.
        !LLVM::call("AddTypeName", self, $name, $type);
    }

    # LLVMDeleteTypeName => "vpt",
    method delete_type(Str $name) {
        LLVM::call("DeleteTypeName", self, $name);
    }

    # LLVMGetTypeByName => "ppt",
    method get_type(Str $name) {
        LLVM::Type.create(
            LLVM::call("GetTypeByName", self, $name)
        )
    }

# BitReader
    # from file
    method read(Str $path){
        my $engine := pir::new("LLVM_Engine");
        my $module := $engine.load_module($path);
        self.wrap($module);
    }

    # from STDIN
    #multi method read(){
    #}

# BitWriter
    # to path
    method write(Str $path){
        LLVM::call("WriteBitcodeToFile", self, $path);
    }

};

# vim: ft=perl6
