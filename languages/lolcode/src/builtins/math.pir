.sub 'SUM OF'
    .param pmc x
    .param pmc y
    $P0 = add x, y
    .return ($P0)
.end

.sub 'DIFF OF'
    .param pmc x
    .param pmc y
    $P0 = sub x, y
    .return ($P0)
.end

.sub 'PRODUKT OF'
    .param pmc x
    .param pmc y
    $P0 = mul x, y
    .return ($P0)
.end

.sub 'QUOSHUNT OF'
    .param pmc x
    .param pmc y
    $P0 = div x, y
    .return ($P0)
.end

.sub 'MOD OF'
    .param num x
    .param num y
    $N0 = mod x, y
    .return ($N0)
.end

.sub 'BIGGR OF'
    .param pmc x
    .param pmc y
    $I0 = islt x, y
    if $I0 goto y_biggr
    .return (x)
  y_biggr:
    .return (y)
.end

.sub 'SMALLR OF'
    .param pmc x
    .param pmc y
    $I0 = isgt x, y
    if $I0 goto y_smallr
    .return (x)
  y_smallr:
    .return (y)
.end

.sub 'FAKTORIAL OF'
    # Get input parameter.
    .param int n

    # return (n > 1 ? n * factorial(n - 1) : 1)
    .local int result

    if n > 1 goto recurse
    result = 1
    goto return

recurse:
    $I0 = n - 1
    result = 'FAKTORIAL OF'($I0)
    result *= n

return:
    .return (result)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

