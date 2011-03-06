#! nqp
=begin Description
LLVM Module.
=end Description


class LLVM::Module {
    our %FUNCTIONS;

    has $!ref;

    method createWithName($name) {
        $!ref := %FUNCTIONS<CreateWithName>($name);
        self;
    }

    method dump() {
        %FUNCTIONS<Dump>($!ref);
    }


    INIT {
        pir::load_bytecode("nqp-setting.pbc");

        # Vivify
        my $lib := pir::loadlib("/usr/lib/libLLVM-2.7.so.1");
        %FUNCTIONS<CreateWithName> := pir::dlfunc__ppss($lib, "LLVMModuleCreateWithName", "pt");
        %FUNCTIONS<Dump>           := pir::dlfunc__ppss($lib, "LLVMDumpModule", "vp");
    }

};

# vim: ft=perl6
