## $Id$

=head1 NAME

src/builtins/op.pir - Cardinal ops

=head1 Functions

=over 4

=cut

.namespace []

.sub 'infix:+' :multi(_,_)
    .param num a
    .param num b
    $P0 = new 'CardinalInteger'
    $N0 = add a, b
    $P0 = $N0
    .return ($P0)
.end


.sub 'infix:+' :multi(CardinalString,_)
    .param pmc a
    .param pmc b
    $P0 = new 'CardinalString'
    $P0 = concat a, b
    .return ($P0)
.end

.sub 'infix:+=' :multi(_,_)
    .param pmc a
    .param pmc b
    a += b
    .return (a)
.end

.sub 'infix:+=' :multi(CardinalString,_)
    .param pmc a
    .param pmc b
    $P0 = 'infix:+'(a,b)
    assign a, $P0
    .return (a)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
