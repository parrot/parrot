## $Id$

=head1 NAME

src/builtins/cmp.pir - Cardinal comparison builtins
Swiped from Rakudo.

=head1 Functions

=over 4

=cut

.namespace []


.sub 'prefix:?' :multi(_)
    .param pmc a
    if a goto a_true
    $P0 = get_hll_global ['Bool'], 'False'
    .return ($P0)
  a_true:
    $P0 = get_hll_global ['Bool'], 'True'
    .return ($P0)
.end

.sub 'infix:==' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(Bool,Bool)
    .param int a
    .param int b
    $I0 = a == b
    $P0 = 'prefix:?'($I0)
    .return ($P0)
.end

.sub 'infix:==' :multi(Integer,Integer)
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(String,String)
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(NilClass,_)
    .param pmc a
    .param pmc b
    # mmd tells us they are different types, so return false
    $I0 = 0
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(_,NilClass)
    .param pmc a
    .param pmc b
    # mmd tells us they are different types, so return false
    $I0 = 0
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(NilClass,NilClass)
    .param pmc a
    .param pmc b
    # mmd tells us they are same types and both of type NilClass, so return true
    $I0 = 1
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:==' :multi(CardinalArray,CardinalArray)
    .param pmc a
    .param pmc b
    .local int i
    $I1 = a.'elems'()
    $I2 = b.'elems'()
    ne $I1, $I2, fail
    i = 0
  loop:
    unless i < $I1 goto success
    $P0 = a[i]
    $P1 = b[i]
    $I0 = 'infix:=='($P0,$P1)
    inc i
    if $I0 goto loop
  fail:
    .tailcall 'prefix:?'(0)
  success:
    .tailcall 'prefix:?'(1)
.end


.sub 'infix:!=' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = 'infix:=='(a, b)
    $I0 = not $I0
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:<' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = islt a, b
    .tailcall 'prefix:?'($I0)
.end

.sub 'infix:<' :multi(Integer,Integer)
    .param pmc a
    .param pmc b
    # creating a specific multi method
    # where marshall into the correct register type
    # gave a much needed boost in performance. Will investigate this later.
    $I0 = a
    $I1 = b
    #$I0 = islt a, b
    $I0 = islt $I0, $I1
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:<=' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = isle a, b
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:>' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = isgt a, b
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:>=' :multi(_,_)
    .param pmc a
    .param pmc b
    $I0 = isge a, b
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:<=>'
    .param pmc a
    .param pmc b
    $I0 = cmp_num a, b
    .return ($I0)
.end

.sub 'infix:=~'
    .param pmc topic
    .param pmc x
    .tailcall x(topic)
.end

.sub 'infix:!~'
    .param pmc topic
    .param pmc x
    $P0 = x(topic)
    $P0 = not $P0
    .return ($P0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
