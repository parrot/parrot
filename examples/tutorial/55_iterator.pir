.sub main :main
    .local pmc myarray, iter

    myarray = split " ", "foo bar baz boz"

    iter = new 'Iterator', myarray
  iter_loop:
    unless iter goto iter_end

    $P0 = shift iter
    say $P0

    goto iter_loop
  iter_end:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

