# $Id$

=head1

say.pir -- simple implementation of a say function

=cut

.namespace

.sub 'VISIBLE'
    .param pmc args            :slurpy
    .param int no_newline      :optional :named('no_newline')
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    if no_newline goto done
    print "\n"
  done:
    .return ()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

