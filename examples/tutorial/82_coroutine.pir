=head1 Coroutines

This example demonstrates creating a coroutine, and using it as an auto
increment (every time you call the coroutine it increments its internal
variable by one).

=cut

.sub main :main
    $I0 = autoincrement()
    print $I0
    print "\n"

    $I1 = autoincrement()
    print $I1
    print "\n"

.end

.sub autoincrement
    $I0 = 1
  start_loop:
    $I0 += 1
    .yield($I0)
  goto start_loop
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

