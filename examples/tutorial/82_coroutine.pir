# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's coroutines.

=head1 COROUTINES

Coroutines are like special subroutines that use C<.yield> instead of
C<.return>. In a normal subroutine, C<.return> passes results back to
the caller, and then destroys the subroutine environment. C<.yield> on
the other hand returns results to the parent but does not destroy the
subroutine environment. The next time the coroutine is called, it
continues execution from the point of the last C<.yield>, as if nothing
has happened. If a coroutine calls C<.return> eventually, it is
destroyed like a normal subroutine and the next call to it will start
from the beginning of the coroutine.

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

