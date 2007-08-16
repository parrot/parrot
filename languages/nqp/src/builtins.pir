.namespace

.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new 'Iterator', list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return (1)
.end


.sub 'say'
    .param pmc list            :slurpy
    'print'(list :flat)
    print "\n"
    .return (1)
.end


.sub 'prefix:~'
    .param pmc a
    $S0 = a
    .return ($S0)
.end


.sub 'prefix:+'
    .param pmc a
    $I0 = does a, 'float'
    if $I0 == 0 goto return_int
    $N0 = a
    .return ($N0)
  return_int:
    $I0 = a
    .return ($I0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
