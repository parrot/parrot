#!/usr/bin/perl

use strict;
use warnings;

print <<"END_OF_HEADER";

# DO NOT EDIT.
# This file generated automatically by '$0'

END_OF_HEADER

my %macros;
$macros{DOMAIN_ERROR} = <<'END_OF_PIR';
    .sym pmc throwable
    throwable = new .Exception
    throwable[0] = "DOMAIN ERROR\n"
    throw throwable
END_OF_PIR

my %scalar = (
    '+' => [ 'Add', '%1 = %1 + %2' ],
	'*' => [ 'Power', << 'END_PIR' ],
	# XXX This is too restrictive. Need better tests
    if %1 >= 0 goto power_ok
%% DOMAIN_ERROR %%
power_ok:
    $N1 = %1
    $N2 = %2
    $N1 = pow $N1, $N2
	%1 = $N1

END_PIR

    '\x{d7}' => [ 'Multiply', '%1 = %1 * %2' ],
    '\x{f7}' => [ 'Divide', '%1 = %1 / %2' ],
    '\u2212' => [ 'Subtract', '%1 = %1 - %2' ],
    '\u2308' => [ 'Maximum',  <<'END_PIR' ],
    if %1 > %2 goto maximum_done
    %1 = %2
maximum_done:
END_PIR

    '\u230a' => [ 'Minimum', <<'END_PIR' ],
    if %1 < %2 goto minimum_done
    %1 = %2
minimum_done:
END_PIR
);


my $template = <<'END_OF_TEMPLATE';

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
    $P100 = new 'APLVector'
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

.sub 'aplformat'
    .param pmc arg

    .local string result
    result = ''

    .local pmc value
    $I0 = does arg, 'array'
    if $I0 goto print_array
    value = arg
    bsr print_value
    .return (result)

  print_array:
    .local string value_type, old_type
    value_type = 'String'
    .local pmc iter
    iter = new .Iterator, arg
    unless iter goto iter_end
  iter_loop:
    old_type = value_type
    value = shift iter
    bsr print_value
    unless iter goto iter_end
    value_type = typeof value
    if value_type != 'String' goto print_space
    if old_type != value_type goto print_space
    goto iter_loop
  print_space:
    result .= ' '
    goto iter_loop
  iter_end:
    .return (result)

  print_value:
    if value >= 0.0 goto print_value_1
    result .= unicode:"\u207b"
    value = abs value
  print_value_1:
    $S0 = value
    result .= $S0
    ret
.end

.sub 'aplprint'
    .param pmc arg

    $S0 = aplformat(arg)
    say $S0
.end

# XXX - the first argument to this multi sub should be some variant of
# integer - but if you set it to Integer or int, the program dies with
# 'Method not found.' or dispatches to the wrong method.

.sub 'dyadic:\u2296' :multi(pmc, APLVector) # rotate
    .param int op1
    .param pmc op2

    if op1 == 0 goto nothing
    if op1 <  0 goto neg
pos:
    unless op1 goto done
    # shift off the beginning and push onto the end.
    $P1 = shift op2
    push op2, $P1
    dec op1
    goto pos
neg:
    unless op1 goto done
    # pop off the end and unshift onto the beginning
    $P1 = pop op2
    unshift op2, $P1
    inc op1
    goto neg

done:
nothing:
    .return(op2)
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

.sub 'dyadic:\u2373' :multi(APLVector, APLVector) # index of
    .param pmc op1
    .param pmc op2
 
    .local pmc iter_one, iter_two
    .local pmc item_one, item_two
    .local int pos_one
    .local int not_found

    not_found = op1
    inc not_found

    .local pmc result
    result = new 'APLVector'

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

.sub 'dyadic:\u2373' :multi(APLVector, Float) # index of
    .param pmc op1
    .param float op2

    .local pmc result
    result = new 'APLVector'
 
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

# XXX this right?
%% DOMAIN_ERROR %%
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
    %% DOMAIN_ERROR %%
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

.sub 'monadic:\u233d' :multi(APLVector) # reverse
    .param pmc op1

    .local pmc result,iter
    result = new 'APLVector'
    iter = new .Iterator, op1
    iter = 0

loop:
    unless iter goto done
    $P1 = shift iter
    unshift result, $P1
    goto loop
done:
    .return(result)
.end

.sub 'dyadic:~' :multi(APLVector, APLVector) # without
    .param pmc op1
    .param pmc op2

    .local pmc result
    result = new 'APLVector'

    .local pmc iter1,iter2
    iter1 = new .Iterator, op1

outer_loop:
    unless iter1 goto outer_done
    $P1 = shift iter1
 
    iter2 = new .Iterator, op2
inner_loop:
    unless iter2 goto inner_done
    $P2 = shift iter2
    if $P1 == $P2 goto outer_loop # result must be without this.
    goto inner_loop

inner_done:
    push result, $P1
    goto outer_loop

outer_done:
    .return(result)
.end

.sub 'monadic:\u2191' # first
    .param pmc op1
    $P1 = shift op1
    .return ($P1)
.end

.sub 'dyadic:\u2191' :multi (Float, APLVector) # take
    .param int op1
    .param pmc op2

    .local pmc result 
    result = new 'APLVector'

    .local pmc iter
    iter = new .Iterator, op2

    if op1 >= 0 goto pos_loop
    iter = 4 # ITERATE_FROM_END

neg_loop:
    if op1 == 0 goto done
    unless iter goto done

    $P1 = pop op2  # have to pop when iterating from end.
    unshift result, $P1

    inc op1
    goto neg_loop

pos_loop:
    if op1 == 0 goto done
    unless iter goto done
    
    $P1 = shift iter
    push result, $P1

    dec op1
    goto pos_loop

done:
    .return (result)
.end

.sub 'dyadic:\u2193' :multi (Float, APLVector) # drop
    .param int op1
    .param pmc op2

    if op1 < 0 goto neg_loop

pos_loop:
    if op1 == 0 goto done
    $P1 = shift op2 # ignore p1, we're discarding it
    dec op1
    goto pos_loop

neg_loop:
    if op1 == 0 goto done
    $P1 = pop op2 # ignore p1, we're discarding it
    inc op1
    goto neg_loop

done:
    .return (op2)
.end

.sub 'monadic:\u2374' :multi (Float) # shape
    .param pmc op1

    .local pmc result
    result = new 'APLVector'
    .return (result)
.end

.sub 'monadic:\u2374' :multi (APLVector) # shape
    .param pmc op1
    .return op1.'get_shape'()
.end

.sub 'monadic:\u2355' #format
    .param pmc op1

    $S0 = aplformat(op1)
    .local pmc result
    result = new 'APLVector'
    $I0 = 0
    $I1 = length $S0
  loop:
    if $I0 >= $I1 goto loop_end 
    $S1 = substr $S0, $I0, 1
    push result, $S1
    inc $I0
    goto loop
  loop_end:
    .return(result)
.end

END_OF_TEMPLATE

# Generate all variants for scalar dyadic ops.
my @type_pairs = (
  [ 'Float', 'Float' ],
  [ 'Float', 'APLVector' ], 
  [ 'APLVector', 'Float' ], 
  [ 'APLVector', 'APLVector' ], 
);

foreach my $operator (keys %scalar) {
    my ($name,$code) = @ {$scalar{$operator}};
    foreach my $types (@type_pairs) {
        my ($type1, $type2) = @$types;

        $template .= <<"END_PREAMBLE";


# $name
.sub 'dyadic:$operator' :multi ( $type1, $type2 )
    .param pmc op1
    .param pmc op2
END_PREAMBLE

        if ($type1 eq "Float" && $type2 eq "Float") {
          # scalar to scalar..
            $template .= interpolate($code, 'op1', 'op2');
        } elsif ($type1 eq "APLVector" && $type2 eq "APLVector") {
          # vector to vector
          $template .= << 'END_PIR';
    # Verify Shapes conform.
    $I1 = op1
    $I2 = op2
    if $I1 == $I2 goto good
    %% DOMAIN_ERROR %%
  good:
    # Create a result vector
    .local pmc result 
    result = new 'APLVector'
    # Loop through each vector, doing the ops.
    .local pmc iter1, iter2
    iter1 = new .Iterator, op1
    iter2 = new .Iterator, op2
  loop:    
    unless iter1 goto loop_done
    $P1 = shift iter1
    $P2 = shift iter2
    $S1 = typeof $P1
    if $S1 == 'String' goto bad_args
    $S2 = typeof $P2
    if $S2 == 'String' goto bad_args
    goto got_args
  bad_args:
    %% DOMAIN_ERROR %%
  got_args:
END_PIR
   
     $template .= interpolate($code, '$P1', '$P2');

          $template .= << 'END_PIR';

    push result, $P1
    goto loop
loop_done:
    # return the result vector
    .return (result)
END_PIR

        } else {
           # Vector to Scalar
           my ($vector, $scalar, @order);
           if ($type1 eq 'APLVector') {
               $vector = "op1";
               $scalar = "op2";
			   @order = qw/ $P1 $P2 /;
           } else {
               $vector = "op2";
               $scalar = "op1";
			   @order = qw/ $P2 $P1 /;
           }

           $template .= << "END_PIR";
    # Create a result vector
    .local pmc result 
    result = new 'APLVector'
    # Loop through each vector, doing the ops.
    .local pmc iter1
    iter1 = new .Iterator, $vector
  loop:    
    unless iter1 goto loop_done
    \$P1 = shift iter1
    \$S1 = typeof \$P1
    if \$S1 != 'String' goto got_args
    %% DOMAIN_ERROR %%
  got_args:
	\$P2 = clone $scalar
END_PIR
   
     $template .= interpolate($code, @order);

     $template .= 'push result, ' . $order[0] . "\n";

          $template .= << 'END_PIR';
    goto loop
loop_done:
    # return the result vector
    .return (result)
END_PIR
        }

        $template .= <<"END_POSTAMBLE"
    .return (op1) # might be pre-empted
.end
END_POSTAMBLE
    }
}

# Substitute all macros
foreach my $macro (keys %macros) {
    $template =~ s/%% \s+ $macro \s+ %%/$macros{$macro}/gx;
}

print $template;

# Given a code snippet, convert it to something usable in the generated file

sub interpolate {
    my $code = shift;
    my $op1  = shift;
    my $op2  = shift;
    $code =~ s/%1/$op1/g;
    $code =~ s/%2/$op2/g;
    $code .= "\n";
    return($code);
}

__END__ 

=head1 NAME

tools/gen_operator_defs.pl - Generate the definitions for all the various
APL operators in all possible configurations.

=for comment

Note that the sub names generated here are single quoted - they look
like unicode, but they're really escaped unicode. Parrot doesn't
allow unicode sub-names yet, so we escape them and use that instead.

Eventually make these be unicode strings. [perl #38964]

=head1 LICENSE

Copyright (C) 2005-2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=cut

