.sub 'eq'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = iseq $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'ne'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isne $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end
