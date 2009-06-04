#! ../../parrot
# Check generating header for parsed PMC

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'pmcc.pbc'

    plan(1)

    .local string filename, content
    filename = 't/data/class27.pmc'
    content = _slurp(filename)

    .local pmc emitter, capture
    (emitter, capture) = get_emitter_and_capture(filename, content, 'past')
    ok("MULTI functions parsed")

    
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
