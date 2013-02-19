# Copyright (C) 2006-2009, Parrot Foundation.

=head1 DESCRIPTION

src/builtins/all.pir -- abc builtin functions

=cut

.namespace []

.sub '&prefix:<++>'
    .param pmc n
    inc n
    .return (n)
.end

.sub '&prefix:<-->'
    .param pmc n
    dec n
    .return (n)
.end


.sub '&postfix:<++>'
    .param pmc n
    $P0 = clone n
    inc n
    .return ($P0)
.end

.sub '&postfix:<-->'
    .param pmc n
    $P0 = clone n
    dec n
    .return ($P0)
.end

.sub '&infix:<&&>'
    .param pmc a
    .param pmc b
    $I0 = istrue a
    $I1 = istrue b
    $I0 = and $I0, $I1
    .return ($I0)
.end

.sub '&infix:<||>'
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

