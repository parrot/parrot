=head1 NAME

src/builtins/oper.pir - operators

=head1 Functions

=over 4

=cut

.namespace []

.sub 'infix:=='
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .return ($I0)
.end


.sub 'infix:!='
    .param pmc a
    .param pmc b
    $I0 = isne a, b
    .return ($I0)
.end


.sub 'infix:<='
    .param pmc a
    .param pmc b
    $I0 = isle a, b
    .return ($I0)
.end


.sub 'infix:>='
    .param pmc a
    .param pmc b
    $I0 = isge a, b
    .return ($I0)
.end


.sub 'infix:<'
    .param pmc a
    .param pmc b
    $I0 = islt a, b
    .return ($I0)
.end


.sub 'infix:>'
    .param pmc a
    .param pmc b
    $I0 = isgt a, b
    .return ($I0)
.end

.sub 'prefix:+'
    .param pmc n
    .return (n)
.end

.sub 'prefix:++'
    .param pmc n
    inc n
    .return (n)
.end

.sub 'prefix:--'
    .param pmc n
    dec n
    .return (n)
.end

.sub 'postfix:++'
    .param pmc n
    $P0 = clone n
    inc n
    .return ($P0)
.end

.sub 'postfix:--'
    .param pmc n
    $P0 = clone n
    dec n
    .return ($P0)
.end

.sub 'infix:^'
    .param num a
    .param num b
    $N0 = pow a, b
    .return ($N0)
.end

.sub 'infix:&'
    .param pmc a
    .param pmc b
    $I0 = istrue a
    $I1 = istrue b
    $I0 = and $I0, $I1
    .return ($I0)
.end

.sub 'infix:|'
    .param pmc a
    .param pmc b
    $I0 = istrue a
    $I1 = istrue b
    $I0 = or $I0, $I1
    .return ($I0)
.end


.sub 'sqrt'
    .param num n
    n = sqrt n
    .return (n)
.end


.sub 'scale'
    .param pmc n
    $S0 = n
    $I0 = index $S0, '.'
    if $I0 >= 0 goto nonzero
    .return (0)
  nonzero:
    $I1 = length $S0
    $I0 = $I1 - $I0
    dec $I0
    .return ($I0)
.end

.sub 'length'
    .param pmc n
    $S0 = n
    $I0 = length $S0
    $I1 = index $S0, '.'
    if $I1 < 0 goto integer
    dec $I0
  integer:
    .return ($I0)
.end

.sub 'saynum'
    .param pmc n
    print n
    print "\n"
.end

.sub 'infix:**'
    .param num a
    .param num b
    $N0 = pow a, b
    .return($N0)
.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the current author and
maintainer.  Patches and suggestions can be sent to
<parrot-porters@perl.org> or <perl-compiler@perl.org> .

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
