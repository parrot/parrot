=head1 NAME

APL::Functions - APL built-in functions and operators

=for comment

Note that the sub names here are single quoted - they look
like unicode, but they're really escaped unicode. Parrot doesn't
allow unicode sub-names yet, so we escape them and use that instead.

Eventually make these be unicode strings. [perl #38964]

=cut

.macro domain_error ()
  .sym pmc throwable
  throwable = new .Exception
  throwable[0] = "DOMAIN ERROR\n"
  throw throwable
.endm

.namespace [ 'APL' ]

# any registers #'d 100 or higher are used here for temporary conversions
# to other types required by the various opcodes. XXX This should go away
# Once PMI ports his lovely new perl6 code back into APL.

.sub "__load_pirtable" :load
    $P0 = new .Hash
    store_global "APL", "%pirtable", $P0

    # these are the 'generic' forms of each op
    $P0['dyadic:']  =  "    $P0 = find_global 'APL', %0\n    %1 = $P0(%1, %2)"
    $P0['monadic:'] =  "    $P0 = find_global 'APL', %0\n    %1 = $P0(%1)"

    # special-purpose parrot ops here
    $P0['dyadic:+']        =  "    %1 = %1 + %2"    # plus
    $P0['dyadic:<']       =  <<"END_PIR"            # less than
    $I100 = islt %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:>']       =  <<"END_PIR"            # greater than
    $I100 = isgt %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:=']       =  <<"END_PIR"            # equal
    $I100 = iseq %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:\x{d7}']  =  "    %1 = %1 * %2"     # multiply
    $P0['dyadic:\x{f7}']  =  "    %1 = %1 / %2"     # slash
    $P0['dyadic:\u2212']  =  "    %1 = %1 - %2"     # subtract
    $P0['dyadic:\u2227']  =  <<"END_PIR"            # and
    $I100 = %1
    $I101 = %2
    $I100 = and $I100, $I101
    %1 = $I100
END_PIR

    $P0['dyadic:\u2228']  = <<"END_PIR"             # or
    $I100 = %1
    $I101 = %2
    $I100 = or $I100, $I101
    %1 = $I100
END_PIR

    $P0['dyadic:\u2260']  = <<"END_PIR"             # not equal
    $I100 = isne %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:\u2264']  = <<"END_PIR"             # not greater than
    $I100 = isle %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:\u2265']  = <<"END_PIR"             # not less than
    $I100 = isge %1, %2
    %1 = $I100
END_PIR

    $P0['dyadic:\u2371']  = <<"END_PIR"             # nor
    $I100 = %1
    $I101 = %2
    $I100 = or $I100, $I101
    $I100 = not $I100
    %1 = $I100
END_PIR

    $P0['dyadic:\u2372']  =  <<"END_PIR"            # nand
    $I100 = %1
    $I101 = %2
    $I100 = and $I100, $I101
    $I100 = not $I100
    %1 = $I100
END_PIR

    $P0['monadic:+']      =  "    noop"             # conjugate
    $P0['monadic:|']      =  "    %1 = abs %1"      # magnitude
    $P0['monadic:!']      =  <<"END_PIR"            # factorial
    $I100 = %1
    $I100 = fact $I100
    %1 = $I100
END_PIR

    $P0['monadic:*']      =  "    %1 = exp %1"      # exp
    $P0['monadic:\x{d7}'] =  <<"END_PIR"            # signum
    $N100 = %1
    $I100 = cmp_num $N100, 0.0
    %1 = $I100
END_PIR
    $P0['monadic:\x{f7}'] =  <<"END_PIR"            # reciprocal
    $N100 = %1
    $N100 = 1.0 / $N100
    %1 = $N100
END_PIR

    $P0['monadic:\u2212'] =  "    %1 = neg %1"      # negate
    $P0['monadic:\u2308'] =  <<"END_PIR"            # ceiling
    $N100 = %1
    $I100 = ceil $N100
    %1 = $I100
END_PIR

    $P0['monadic:\u230a'] =  <<"END_PIR"            # floor
    $N100 = %1
    $I100 = floor $N100
    %1 = $I100
END_PIR

    $P0['monadic:\u235f'] =  "    %1 = ln %1"


    $P0['monadic:\u25cb'] =  "    %1 *= 3.14159265358979323846"
                                      # PI

    $P0['monadic:\u2373']  =  <<"END_PIR"            # index of
    #XXX hack all the _1's need the same, generated unique number.
    $P100 = new .ResizablePMCArray
    $I100 = 1
    $I101 = 0
    $I102 = %1
  loop_begin_1:
    if $I100 > $I102 goto loop_done_1 
    $P100[$I101] = $I100
    inc $I101
    inc $I100
    goto loop_begin_1
  loop_done_1:
    %1 = $P100
END_PIR

.end

.sub 'aplprint'
    .param pmc arg
    .local pmc value
    $I0 = isa arg, "ResizablePMCArray"
    if $I0 goto print_array
    value = arg
    bsr print_value
    print "\n"
    .return ()

  print_array:
    .local pmc iter
    iter = new .Iterator, arg
    iter = 0
    unless iter goto iter_end
  iter_loop:
    value = shift iter
    bsr print_value
    unless iter goto iter_end
    print ' '
    goto iter_loop
  iter_end:
    print "\n"
    .return ()

  print_value:
    if value >= 0 goto print_value_1
    print unicode:"\u207b"
    value = abs value
  print_value_1:
    print value
    ret
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

.sub 'dyadic:\u2373' :multi(String, String) # index of
    .param string op1
    .param string op2

    .local pmc result
    result = new .ResizablePMCArray
    
    .local int pos
    pos = 0
    .local int len
    len = length op2
    .local int index_pos
    .local string index_char
    .local int not_there
    not_there = length op1
    inc not_there

loop_begin:
    if pos == len goto loop_end
    index_char = substr op2, pos, 1 
    index_pos = index op1, index_char 
    if index_pos == -1 goto not_found
    inc index_pos
    push result, index_pos
    goto loop_next
not_found:
    push result, not_there
loop_next:
    inc pos
    goto loop_begin
loop_end:
    .return (result)
.end

.sub 'dyadic:\u2373' :multi(ResizablePMCArray, ResizablePMCArray) # index of
    .param pmc op1
    .param pmc op2

    .local pmc iter_one, iter_two
	.local pmc item_one, item_two
	.local int pos_one
	.local int not_found
	not_found = op1

	.local pmc result
	result = new .ResizablePMCArray

	iter_two = new .Iterator, op2
	iter_two = 0 # start from beginning
loop_two:
    unless iter_two goto loop_two_end
    item_two = shift iter_two 
	iter_one = new .Iterator, op1
	iter_one = 0 # start from beginning
    pos_one = 0 # parrot's 0 == APL's 1
loop_one:
    unless iter_one goto loop_one_end
    item_one = shift iter_one 
	inc pos_one
    if item_one != item_two goto loop_one
    push result, pos_one
	# only need to find one, go back to outer loop.
    goto loop_two
loop_one_end:
    # if we get this far, there was no match.
	push result, not_found

    goto loop_two 
loop_two_end:

    .return (result)
.end

.sub 'dyadic:\u2373' :multi(ResizablePMCArray, Float) # index of
    .param pmc op1
    .param float op2

    .local pmc result
    result = new .ResizablePMCArray
 
    .local int pos
    pos = 0
    .local float value_at
    .local int not_there
    not_there = op1
    inc not_there
    .local pmc iter
	iter = new .Iterator, op1
    iter = 0 # start from beginning.
loop_begin:
    unless iter goto no_gots
    value_at = shift iter
    if value_at == op2 goto got_it
    inc pos
    goto loop_begin
got_it:
    inc pos
    push result, pos
    .return (result)
no_gots:
    push result, not_there
    .return (result)
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
