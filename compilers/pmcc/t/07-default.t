#! ../../parrot
# Check handling of default.pmc

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'pmcc.pbc'

    plan(2)

    # Parse "default" pmc.
    .local pmc emitter, capture
    .local string generated
    $S0 = _slurp('t/data/default.pmc')
    (emitter, capture) = get_emitter_and_capture('t/data/default.pmc', $S0, 'past')
    generated = emitter.'generate_c_code'(capture)

    say generated

    like(generated, "'Parrot_default_get_vtable'", "Parrot_default_get_vtable generated") 

    #this should be generated, even though it's not explicitly defined in default.pmc
    like(generated, "'Parrot_default_set_number_keyed'", "Parrot_default_set_number_keyed_int generated") 
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
