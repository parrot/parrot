module LLVM {
    our %F;

    INIT {
        pir::load_bytecode("nqp-setting.pbc");

        my $lib   := pir::loadlib("/usr/lib/libLLVM-2.7.so.1");
        my %funcs := hash(
            LLVMModuleCreateWithName    => "pt",
            LLVMDumpModule              => "vp",
        );

        for %funcs.kv -> $name, $signature {
            %F{$name} := pir::dlfunc__ppss($lib, $name, $signature);
        }
    }
}

