.namespace

.sub 'infix:=='
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .return ($I0)
.end


.sub 'infix:!='
    .param pmc a
    .param pmc b
    $I0 = isne a, b
    .return ($I0)
.end


.sub 'infix:<='
    .param pmc a
    .param pmc b
    $I0 = isle a, b
    .return ($I0)
.end


.sub 'infix:>='
    .param pmc a
    .param pmc b
    $I0 = isge a, b
    .return ($I0)
.end


.sub 'infix:<'
    .param pmc a
    .param pmc b
    $I0 = islt a, b
    .return ($I0)
.end


.sub 'infix:>'
    .param pmc a
    .param pmc b
    $I0 = isgt a, b
    .return ($I0)
.end


.sub 'prefix:++'
    .param pmc n
    inc n
    .return (n)
.end

.sub 'prefix:--'
    .param pmc n
    dec n
    .return (n)
.end

.sub 'postfix:++'
    .param pmc n
    $P0 = clone n
    inc n
    .return ($P0)
.end

.sub 'postfix:--'
    .param pmc n
    $P0 = clone n
    dec n
    .return ($P0)
.end

.sub 'saynum'
    .param pmc n
    .local pmc array
    print n
    print "\n"
.end
