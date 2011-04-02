#! parrot-nqp

# Test pir files from t/compilers/opsc/data

# We want Test::More features for testing. Not NQP's builtin.
Q:PIR { .include "test_more.pir" };
pir::load_bytecode("opsc.pbc");

my $debug := 0;
test_single_file("t/compilers/opsc/data/03.pir", $debug);

done_testing();

# JIT and run single PIR file.
sub test_single_file($pir, $debug) {
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

    # OpLib
    my $oplib := pir::new__psp("OpLib", "core_ops");

    # Parse "jitted.ops"
    my $ops_file := Ops::File.new("t/jit/jitted.ops",
        :oplib($oplib),
        :core(0),
        :quiet(!$debug),
    );

    # Create JITter.
    my $jitter := Ops::JIT.new($pbc, $ops_file, $oplib, debug => $debug);

    my $start := 0;
    my %jit_context := $jitter.jit($start);
    my $module := %jit_context<_module>;
    $module.verify();

    # Create interp and seed it with bytecode
    my $this_interp := pir::getinterp();
    my $interp := func("make_interpreter", "ppi")($this_interp, 0);
    func("Parrot_api_load_bytecode_file", "iPSP")($this_interp, $pbc, undef);

    # "Invoke" target Sub inside target interp.
    my $sub := Q:PIR{ %r = find_sub_not_null "main" };
    my $pc;
    $pc := func("Parrot_PMC_invoke", "ppPP")($interp, $sub, $pc);


    # Some engine
    my $engine := pir::new__psp("LLVM_Engine", $module);
    my $call := $engine.create_call(%jit_context<jitted_sub>, "ppp");

    my $new_stdout := pir::new('StringHandle');
    $new_stdout.open("dummy", "w");

    # Override stdout inside target interp
    func("Parrot_io_stdhandle", "PpiP")($interp, 1, $new_stdout);

    # Go!
    $pc := $call($pc, $interp);

    is($new_stdout.readall(), $expected, $pir);
}

#%jit_context<_module>.dump();

sub func($name, $sig) {
    pir::dlfunc__ppss(undef, $name, $sig);
}

# vim: ft=perl6
