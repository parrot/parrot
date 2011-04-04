#! parrot-nqp

# Test pir files from t/compilers/opsc/data

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("opsc.pbc");

my $debug := 0;
# OpLib
my $oplib := pir::new__psp("OpLib", "core_ops");

# Parse "jitted.ops"
my $ops_file := Ops::File.new("t/jit/jitted.ops",
    :oplib($oplib),
    :core(0),
    :quiet(!$debug),
);

for <01 02 03 04 06> {
    test_single_file("t/compilers/opsc/data/$_.pir", $oplib, $ops_file, $debug);
}

done_testing();

# JIT and run single PIR file.
sub test_single_file($pir, $oplib, $ops_file, $debug) {
    # Some preparation
    my $pbc    := subst($pir, / 'pir' $/, 'pbc');

    # Generate PBC file
    my @args   := list("./parrot", "-o", $pbc, $pir);
    my $res    := pir::spawnw__ip(@args);

    # Embedded test results
    my $pir_src := slurp($pir);
    my $/       := $pir_src ~~ /
        '# BEGIN_RESULTS' \n
        [ '# ' (\N+ \n) ]+
        '# END_RESULTS'
    /;
    my $expected := $/[0].join('');

    # Create JITter.
    my $jitter := Ops::JIT.new($pbc, $ops_file, $oplib, debug => $debug);
    my $module := $jitter.module;
    # Some engine
    my $engine := pir::new("LLVM_Engine", $module);

    # Create interp and seed it with bytecode
    my $this_interp := pir::getinterp();
    # Parrot_api_load_bytecode_file do something weird with interp->api_jmp_buf
    # which prevent clean exit from parrot.
    #my $pbc_ums     := pir::new('UnManagedStruct');
    #func("Parrot_api_load_bytecode_file", "iPSP")($this_interp, $pbc, $pbc_ums);
    func("PackFile_read_pbc", "ppSi")($this_interp, $pbc, 0);

    my $interp := pir::new__psp("ParrotInterpreter", $this_interp);

    # Override stdout inside target interp
    my $new_stdout := pir::new('StringHandle');
    $new_stdout.open("dummy", "w");
    func("Parrot_io_stdhandle", "PpiP")($interp, 1, $new_stdout);

    # "Invoke" target Sub inside target interp.
    my $sub := Q:PIR{ %r = find_sub_not_null "main" };

    my $start       := $sub.start_offs();
    my $pc          := func("Parrot_PMC_invoke", "ipPP")($interp, $sub, $pc);
    my $base_offset := $pc - $start;

    # Runcore loop
    while ($pc) {
        my %jit_context := $jitter.jit($start);
        $module.verify();

        my $call := $engine.create_call(%jit_context<jitted_sub>, "iip");

        # Go!
        $pc    := $call($pc, $interp);
        $start := $pc - $base_offset;
    }

    is($new_stdout.readall(), $expected, $pir);
}

#%jit_context<_module>.dump();

sub func($name, $sig) {
    pir::dlfunc__ppss(undef, $name, $sig);
}

# vim: ft=perl6
