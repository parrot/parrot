#! ../../parrot
# Check generating header for parsed PMC

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'pmcc.pbc'

    plan(2)

    .local string filename, content
    filename = 't/data/class27.pmc'
    content = _slurp(filename)

    .local pmc emitter, capture
    .local string generated
    (emitter, capture) = get_emitter_and_capture(filename, content, 'past')
    
    generated = emitter.'generate_c_code'(capture)

    like(generated, "'Parrot_Integer_multi_add_Integer_PMC'", "Integer,PMC method generated") 
    like(generated, "'Parrot_Integer_multi_add_DEFAULT_PMC'", "DEFAULT,PMC method generated") 

    # Part of class_init
    like(generated, "'CONST_STRING_GEN(interp, \"Integer,PMC\")'", "We have generated CONST_STRINGS");
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
