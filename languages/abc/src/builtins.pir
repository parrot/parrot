.namespace

.sub 'infix:=='
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .return ($I0)
.end


.sub 'infix:<'
    .param pmc a
    .param pmc b
    $I0 = islt a, b
    .return ($I0)
.end
