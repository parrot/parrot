# $Id$

=head1

builtin functions for Ruby.

=cut

.namespace

.sub 'print'
    .param pmc args            :slurpy
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return ()
.end

.sub 'puts'
    .param pmc args            :slurpy
    'print'(args :flat, "\n")
.end

.namespace ["Array"]

.sub 'new' :method
    .param pmc values :slurpy
    .return (values)
.end


.namespace ["Hash"]

.sub 'new' :method
    .param pmc values :slurpy :named
    .return (values)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

