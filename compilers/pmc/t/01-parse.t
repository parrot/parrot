#!parrot


.sub 'main' :main
.include 'test_more.pir'
load_bytecode 'compilers/pmc/pmc.pbc'
    .local int total
    total = 23

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
    $S0 = sprintf "./compilers/pmc/t/data/class%02d.pmc", $P0
    test_parse_one($S0)
    inc i
    unless i >= total goto loop

.end

.sub 'test_parse_one'
    .param string file
    $S0 = _slurp(file)
    .local pmc compiler
    compiler = compreg 'PMC'
    push_eh fail
    compiler.'parse'($S0)
    pop_eh
    ok(1, file)
    .return ()
  fail:
    pop_eh
    ok(0, file)
.end

.sub '_slurp'
    .param string file
    .local pmc pio
    pio  = open file
    $S0  = pio.'readall'()
    close pio
    .return ($S0)
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
