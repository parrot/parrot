.sub 'BOTH SAEM'
    .param pmc x
    .param pmc y
    eq x, y, WIN
    $P0 = new 'Boolean'
    $P0 = 0
    .return($P0)
  WIN:
    $P0 = new 'Boolean'
    $P0 = 1
    .return ($P0)
.end

.sub 'DIFFRINT'
    .param pmc x
    .param pmc y
    ne x, y, WIN
    $P0 = new 'Boolean'
    $P0 = 0
    .return($P0)
  WIN:
    $P0 = new 'Boolean'
    $P0 = 1
    .return ($P0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

