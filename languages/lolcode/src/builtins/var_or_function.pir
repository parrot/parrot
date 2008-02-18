# $Id$

=head1

var_or_function.pir - Distinguish variable access and function call

=cut

.namespace

.sub 'var_or_function'
    .param pmc name
    .local pmc result
    $I0 = isa name, 'Sub'
    if $I0 goto funcall
    .return (name)
    funcall:
    result = name()
    .return (result)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

