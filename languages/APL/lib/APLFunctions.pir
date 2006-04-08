=head1 NAME

APL::Functions - APL built-in functions and operators

=cut

.namespace [ "APL::Functions" ]

.sub "dyadic:+"                # dyadic add
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 + op2
    .return ($P0)
.end

.sub 'dyadic:\u2212'           # dyadic subtract
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 - op2
    .return ($P0)
.end

.sub 'dyadic:\x{d7}'           # dyadic multiply
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 * op2
    .return ($P0)
.end

.sub 'dyadic:\x{f7}'           # dyadic divide
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 / op2
    .return ($P0)
.end


.sub 'monadic:+'               # monadic plus
    .param pmc op1
    .return (op1)
.end

.sub 'monadic:\u2212'          # negation
    .param pmc op1
    $P0 = clone op1
    $P0 = neg $P0
    .return ($P0)
.end

.sub 'monadic:\x{d7}'          # signum
    .param num op1
    $I0 = cmp_num op1, 0.0
    .return ($I0)
.end

.sub 'monadic:\x{f7}'          # reciprocal
    .param num op1
    $N0 = 1.0 / op1
    .return ($N0)
.end


=head1 LICENSE

Copyright (c) 2005-2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut
