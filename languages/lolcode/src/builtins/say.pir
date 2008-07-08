# $Id$

=head1

say.pir -- simple implementation of a say function

=cut

.namespace []

.sub 'VISIBLE'
    .param pmc args            :slurpy
    .local int no_newline
    no_newline = 0
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    $I0 = iseq $S0, '!'
    if $I0 goto no_print
    print $S0
    goto iter_loop
    no_print:
    no_newline = 1
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

