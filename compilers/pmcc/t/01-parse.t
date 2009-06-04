#! ../../parrot

.include 't/common.pir'

.sub 'main' :main

    .include 'test_more.pir'
    load_bytecode 'pmcc.pbc'

    .local int total
    total = 28

    plan(total)
    test_parse(total)
.end

.sub 'test_parse'
    .param int total
    .local int i
    i = 0
  loop:
    $P0 = new 'ResizablePMCArray'
    push $P0, i
    $S0 = sprintf "t/data/class%02d.pmc", $P0
    $S1 = test_parse_one($S0)
    is($S1, '', $S0)
    inc i
    unless i >= total goto loop

.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
