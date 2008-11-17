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

.sub 'infix:-' :multi(_,_)
    .param num a
    .param num b
    $P0 = new 'CardinalInteger'
    $N0 = sub a, b
    $P0 = $N0
    .return ($P0)
.end

.sub 'infix:-' :multi(CardinalArray,CardinalArray)
    .param pmc a
    .param pmc b
    $P0 = new 'CardinalArray'
    .local pmc iter
    iter = new 'Iterator', a
    $P3 = get_hll_global['Bool'], 'False'
    iter_loop:
        unless iter goto done
        $P1 = shift iter
        $P2 = b.'include?'($P1)
        $I0 = 'infix:=='($P2, $P3)
        eq $I0, 1, appendit
        #eq $P2, $P3, appendit
        goto iter_loop
    appendit:
        $P0.'push'($P1)
        goto iter_loop
    done:
        .return($P0)
.end

.sub 'infix:*' :multi(_,_)
    .param num a
    .param num b
    $P0 = new 'CardinalInteger'
    $N0 = mul a, b
    $P0 = $N0
    .return ($P0)
.end

.sub 'infix:/' :multi(_,_)
    .param num a
    .param num b
    $P0 = new 'CardinalInteger'
    $N0 = div a, b
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

.sub 'infix:+' :multi(CardinalArray,CardinalArray)
    .param pmc a
    .param pmc b
    $P0 = new 'CardinalArray'
    $P0 = 'list'(a :flat, b :flat)
    .return ($P0)
.end

.sub 'infix:-=' :multi(_,_)
    .param pmc a
    .param pmc b
    a -= b
    .return (a)
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

.sub 'infix:&' :multi(_,_)
    .param int a
    .param int b
    $I0 = band a, b
    .return ($I0)
.end

.sub 'infix:&' :multi(CardinalArray,CardinalArray)
    .param pmc a
    .param pmc b
    .local pmc intersection
    intersection = new 'CardinalArray'
    .local pmc item
    .local pmc it
    it = iter a
  loop:
    unless it goto loop_end
    item = shift it
    $I0 = b.'include?'(item)
    unless $I0, loop
    intersection.'push'(item)
    goto loop
  loop_end:
    .return (intersection)
.end

.sub 'infix:*' :multi(CardinalString,CardinalInteger)
    .param pmc a
    .param pmc b
    $P0 = new 'CardinalString'
    $P0 = repeat a, b
    .return ($P0)
.end


## autoincrement
.sub 'postfix:++' :multi(_)
    .param pmc a
    $P0 = clone a
    inc a
    .return ($P0)
    #.return (a)
.end

.sub 'postfix:--' :multi(_)
    .param pmc a
    $P0 = clone a
    dec a
    .return ($P0)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
