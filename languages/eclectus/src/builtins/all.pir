# $Id$

# Eclectus builtin subroutines

.sub 'say'
    .param pmc args :slurpy

    if null args goto end
    .local pmc iter
    iter = new 'Iterator', args
loop:
    unless iter goto end
    $P0 = shift iter
    print $P0

    goto loop
end:
    say ''

    .return ('')
.end

.sub 'eclectus:<'
    .param num a
    .param num b

    $I0 = islt a, b

    .return ($I0)
.end

.sub 'eclectus:<='
    .param num a
    .param num b

    $I0 = isle a, b

    .return ($I0)
.end

.sub 'eclectus:=='
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = iseq $I0, 0

    .return ($I0)
.end

.sub 'eclectus:>='
    .param num a
    .param num b

    $I0 = isge a, b

    .return ($I0)
.end

.sub 'eclectus:>'
    .param num a
    .param num b

    $I0 = isgt a, b

    .return ($I0)
.end

.sub 'eq?'
    .param pmc a
    .param pmc b

    $I0 = issame a, b

    .return ($I0)
.end

.sub 'eqv?'
    .param pmc a
    .param pmc b

    $I0 = iseq a, b

    .return ($I0)
.end

.sub 'equal?'
    .param pmc a
    .param pmc b

    $I0 = iseq a, b

    .return ($I0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
