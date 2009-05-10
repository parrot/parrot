#! ../../parrot
# Check handling of default.pmc

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'pmcc.pbc'

    plan(1)

    # Parse "default" pmc.
    .local pmc emitter, capture
    .local string generated
    $S0 = _slurp('t/data/default.pmc')
    (emitter, capture) = get_emitter_and_capture('t/data/default.pmc', $S0, 'past')
    generated = emitter.'generate_c_file'(capture)

    say generated

    like($S0, "'Parrot_default_get_vtable'", "Parrot_default_get_vtable generated") 
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
