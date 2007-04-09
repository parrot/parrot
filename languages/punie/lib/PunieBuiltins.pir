.sub 'infix:=='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = iseq $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:!='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isne $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:<'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = islt $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:>'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isgt $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:<='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isle $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:>='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isge $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:eq'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = iseq $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:ne'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isne $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:lt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = islt $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:gt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isgt $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:le'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isle $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:ge'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isge $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return (1)
.end

.sub 'infix:,'
    .param pmc args            :slurpy
    .return (args)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
