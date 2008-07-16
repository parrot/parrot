=head1

expr_parse.pir - parse an expression and dispatch function calls with their appropriate arguments.

=cut

.namespace []

.sub lookup
    .param string name
    $P0 = find_name name
    if_null $P0, null_token
    .return($P0)
  null_token:
    .return("NULL")
.end

.sub lookup_class
    .param pmc item
    $P0 = class item
    $S0 = $P0
    .return($S0)
.end

.sub defined
    .param pmc item
    $I0 = defined item
    .return($I0)
.end

.sub get_inspect_info
    .param pmc item
    $P0 = inspect item
    .return($P0)
.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

