#!parrot

.include 'compilers/pmc/t/common.pir'

.sub 'main' :main
.include 'test_more.pir'
load_bytecode 'compilers/pmc/pmc.pbc'

    .local int total
    total = 0

    plan(total)
    test_past(total)
.end

.sub 'test_past'
    .param int total
    .local int i
    i = 0
  loop:
    if i >= total goto done
    $P0 = new 'ResizablePMCArray'
    push $P0, i
    $S0 = sprintf "./compilers/pmc/t/data/class%02d.pmc", $P0
    $S1 = sprintf "./compilers/pmc/t/data/class%02d.past", $P0
    test_past_one($S0, $S1)
    inc i
    goto loop
  done:
    .return()
.end

.sub 'test_past_one'
    .param string file
    .param string past

    push_eh fail

    .local pmc compiler
    compiler = compreg 'PMC'
    compiler.'compile'(file, 'target'=>'past')
    pop_eh
    $S0 = $P0
    $S1 = _slurp(past)
    is($S0, $S1, file)
    .return()

  fail:
    .local pmc exception
    .local string message
    .get_results (exception)
    message = exception['message']
    ok(0, message)
.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
