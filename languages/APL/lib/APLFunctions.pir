=head1 NAME

APL::Functions - APL built-in functions and operators

=for comment

Note that the sub names here are single quoted - they look
like unicode, but they're really escaped unicode. Parrot doesn't
allow unicode sub-names yet, so we escape them and use that instead.

Eventually make these be unicode strings.

=cut

.macro domain_error ()
  .sym pmc throwable
  throwable = new .Exception
  throwable[0] = "DOMAIN ERROR"
.endm

.namespace [ 'APL' ]

.const num PI = 3.14159265358979323846


.sub "__load_pirtable" :load
    $P0 = new .Hash
    store_global "APL", "%pirtable", $P0

    # these are the 'generic' forms of each op
    $P0['dyadic:']        =  "    %1 = '%0'(%1, %2)"
    $P0['monadic:']       =  "    %1 = '%0'(%1)"

    # special-purpose parrot ops here
    $P0['dyadic:+']       =  "    %1 = %1 + %2"
    $P0['dyadic:\u2212']  =  "    %1 = %1 - %2"
    $P0['dyadic:\x{d7}']  =  "    %1 = %1 * %2"
    $P0['dyadic:\x{f7}']  =  "    %1 = %1 / %2"
.end


.sub 'aplprint'
    .param pmc value
    if value >= 0 goto print_value
    print unicode:"\u207b"
    value = abs value
  print_value:
    print value
    print "\n"
.end


.sub 'dyadic:+'                # add
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 + op2
    .return ($P0)
.end

.sub 'dyadic:\u2212'           # subtract
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 - op2
    .return ($P0)
.end

.sub 'dyadic:\x{d7}'           # multiply
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 * op2
    .return ($P0)
.end

.sub 'dyadic:\x{f7}'           # divide
    .param pmc op1
    .param pmc op2
    $P0 = clone op1
    $P0 = op1 / op2
    .return ($P0)
.end

.sub 'dyadic:\u2308'           # maximum
    .param pmc op1
    .param pmc op2
    if op1 > op2 goto one
    .return(op2)
one:
    .return(op1)
.end

.sub 'dyadic:\u230a'           # minimum
    .param pmc op1
    .param pmc op2
    if op1 > op2 goto one
    .return(op1)
one:
    .return(op2)
.end

.sub 'dyadic:*'           # power
    .param pmc op1
    .param pmc op2
    if op1 <0 goto negative_bad
    $N1 = op1
    $N2 = op2
    $N3 = pow $N1, $N2
    .return($N3)
negative_bad: # XXX This may be *too* protective.
    .domain_error()
.end

.sub 'dyadic:!'           # binomial coefficient
    .param pmc op1
    .param pmc op2
    $I1 = op1
    $I2 = op2
    $I3 = $I2 - $I1   

    $N1 = fact $I1
    $N2 = fact $I2
    $N3 = fact $I3

    $N2 /= $N3 
    $N2 /= $N1 
    .return($N2)
.end

.sub 'dyadic:\u25cb'          # circle
    .param num op1
    .param num op2
    $I1 = op1
    if $I1 == 0 goto zero
    if $I1 == 1 goto one
    if $I1 == 2 goto two
    if $I1 == 3 goto three
    if $I1 == 4 goto four
    if $I1 == 5 goto five
    if $I1 == 6 goto six
    if $I1 == 7 goto seven
    if $I1 == -1 goto neg_one
    if $I1 == -2 goto neg_two
    if $I1 == -3 goto neg_three
    if $I1 == -4 goto neg_four
    if $I1 == -5 goto neg_five
    if $I1 == -6 goto neg_six
    if $I1 == -7 goto neg_seven

.domain_error() # XXX this right?
zero:
    $N1 = op2 * op2
    $N1 = 1 - $N1
    $N1 = sqrt $N1
    .return ($N1)
one:
    $N1 = sin op2
    .return ($N1)
two:
    $N1 = cos op2
    .return ($N1)
three:
    $N1 = tan op2
    .return ($N1)
four:
    $N1 = op2 * op2
    $N1 += 1
    $N1 = sqrt $N1
    .return ($N1)
five:
    $N1 = sinh op2
    .return ($N1)
six:
    $N1 = cosh op2
    .return ($N1)
seven:
    $N1 = tanh op2
    .return ($N1)
neg_one:
    $N1 = asin op2
    .return ($N1)
neg_two:
    $N1 = acos op2
    .return ($N1)
neg_three:
    $N1 = atan op2
    .return ($N1)
neg_four:
    $N1 = op2 * op2
    $N1 = 1 - $N1
    $N1 = sqrt $N1
    .return ($N1)
# These next three are implemented in terms of the available parrot opcodes.
neg_five:  # arcsinh(x) = ln(x+sqrt(x*x+1))
    $N1 = op2 * op2
    inc $N1
    $N1 = sqrt $N1
    $N1 += op2
    $N1 = ln $N1
    .return ($N1)
neg_six:   # arccosh(x) = ln(x+sqrt(x-1)*sqrt(x+1))
    $N1 = op2 + 1
    $N1 = sqrt $N1
    $N2 = op2 - 1
    $N2 = sqrt $N2
    $N2 *= $N1
    $N2 = op2 + $N2
    $N2 = ln $N2
    .return ($N2)
neg_seven: # arctanh(x) = .5 * (ln (1+x) - ln (1 -x))
    $N1 = op2 + 1
    $N1 = ln $N1
    $N2 = 1 - op2
    $N2 = ln $N2
    $N1 = $N1 - $N2
    $N1 *= 0.5
    .return ($N1)
.end

.sub 'dyadic:\u235f'          # logarithm
    .param num op1
    .param num op2
    $N1 = ln op1
    $N2 = ln op2
    $N3 = $N1 / $N2
    .return($N3)
.end

# This somewhat convoluted based the description from the old APL/360 manual
.sub 'dyadic:|'               # logarithm
    .param num op1
    .param num op2
    if op1 == 0 goto zero_LHS
    op1 = abs op1
    $N1 = op2 / op1
    $I1 = floor $N1
    $N1 = op1 * $I1
    $N2 = op2 - $N1
    .return($N2)
zero_LHS:
    if op2 < 0 goto neg_RHS
    .return(op2) 
neg_RHS:
    .domain_error()
.end

.sub 'dyadic:\u2227' # and
    .param int op1
    .param int op2
    $I0 = and op1, op2
    .return ($I0)
.end

.sub 'dyadic:\u2228' # or
    .param int op1
    .param int op2
    $I0 = or op1, op2
    .return ($I0)
.end

.sub 'dyadic:\u2372' # nan
    .param int op1
    .param int op2
    $I0 = and op1, op2
    $I0 = not $I0
    .return ($I0)
.end

.sub 'dyadic:\u2371' # nor
    .param int op1
    .param int op2
    $I0 = or op1, op2
    $I0 = not $I0
    .return ($I0)
.end

.sub 'dyadic:<' # less than
    .param int op1
    .param int op2
    $I0 = islt op1, op2
    .return ($I0)
.end

.sub 'dyadic:\u2264' # not greater than
    .param int op1
    .param int op2
    $I0 = isle op1, op2
    .return ($I0)
.end

.sub 'dyadic:=' # equal
    .param int op1
    .param int op2
    $I0 = iseq op1, op2
    .return ($I0)
.end

.sub 'dyadic:\u2265' # not less than
    .param int op1
    .param int op2
    $I0 = isge op1, op2
    .return ($I0)
.end

.sub 'dyadic:>' # greater
    .param int op1
    .param int op2
    $I0 = isgt op1, op2
    .return ($I0)
.end

.sub 'dyadic:\u2260' # not equal
    .param int op1
    .param int op2
    $I0 = isne op1, op2
    .return ($I0)
.end

.sub 'monadic:!'               # factorial
  .param pmc op1
  .local int result
  $I1 = op1
  $N1 = fact $I1
  .return($N1)
.end

.sub 'monadic:+'               # plus
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

.sub 'monadic:\u25cb'          # pi
    .param num op1
    $N0 = PI * op1
    .return ($N0)
.end

.sub 'monadic:\u2308'          # ceiling
    .param num op1
    $N1 = ceil op1
    .return($N1)
.end

.sub 'monadic:\u230a'          # floor
    .param num op1
    $N1 = floor op1
    .return($N1)
.end

.sub 'monadic:*'               # exponential
    .param num op1
    $N1 = exp op1
    .return($N1)
.end

.sub 'monadic:\u235f'          # ln
    .param num op1
    $N1 = ln op1
    .return($N1)
.end

.sub 'monadic:|'               # magnitude
    .param num op1
    $N1 = abs op1
    .return($N1)
.end

.sub 'monadic:~'               # not
    .param num op1
    # XXX is domain only 0,1?
    $I1 = op1
    if $I1 goto true
    .return(1)
true:
    .return(0)
.end

=head1 LICENSE

Copyright (c) 2005-2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut
