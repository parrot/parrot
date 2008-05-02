## $Id$

=head1 NAME

src/builtins/cmp.pir - Cardinal comparison builtins
Swiped from Rakudo.

=head1 Functions

=over 4

=cut

.namespace


.sub 'prefix:?' :multi(_)
    .param pmc a
    if a goto a_true
    $I0 = 0
    .return ($I0)
    $P0 = get_hll_global ['Bool'], 'False'
    .return ($P0)
  a_true:
    $I0 = 1
    .return ($I0)
    $P0 = get_hll_global ['Bool'], 'True'
    .return ($P0)
.end

.sub 'infix:==' :multi(_,_)
    .param num a
    .param num b
    $I0 = iseq a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:!=' :multi(_,_)
    .param num a
    .param num b
    $I0 = isne a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:<' :multi(_,_)
    .param num a
    .param num b
    $I0 = islt a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:<=' :multi(_,_)
    .param num a
    .param num b
    $I0 = isle a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:>' :multi(_,_)
    .param num a
    .param num b
    $I0 = isgt a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:>=' :multi(_,_)
    .param num a
    .param num b
    $I0 = isge a, b
    .return 'prefix:?'($I0)
.end


.sub 'infix:<=>'
    .param pmc a
    .param pmc b
    $I0 = cmp_num a, b
    .return ($I0)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
