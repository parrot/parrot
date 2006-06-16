.sub '=='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = iseq $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub '!='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isne $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub '<'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = islt $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub '>'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isgt $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub '<='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isle $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

.sub '>='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isge $I1, $I2
    $P1 = new Integer
    $P1 = $I3
    .return($P1)
.end

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

.sub 'lt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = islt $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'gt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isgt $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'le'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isle $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end

.sub 'ge'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isge $S1, $S2
    $P1 = new Integer
    $P1 = $I1
    .return($P1)
.end
