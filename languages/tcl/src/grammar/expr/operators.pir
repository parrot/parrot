# $Id$

=head1 NAME

src/expr/operators.pir - [expr] operator definitions.

=head1 Functions

=over 4

=cut

.namespace

# XXX No strings.
.sub 'prefix:+' # unary plus
    .param pmc a
    $N0 = a
    .return ($N0)
.end

# XXX No strings.
.sub 'prefix:-'     # unary minus
    .param pmc a
    $N0 = a
    $N0 = neg $N0
    .return ($N0)
.end

# XXX Integer Only
.sub 'prefix:~'     # bit-wise NOT
    .param int a
    $I0 = bnot a
    .return ($I0)
.end

# XXX No strings.
.sub 'prefix:!'     # logical NOT
    .param int a
    $I0 = not a
    .return ($I0)
.end

# XXX No Strings.
.sub 'infix:*'      # multiply
    .param pmc a
    .param pmc b
    $P0 = mul a, b
    .return ($P0)
.end

# XXX No Strings.
.sub 'infix:/'     # divide
    .param float a
    .param float b
    $N0 = div a, b
    .return ($N0)
.end

# XXX Integer Only
.sub 'infix:%'     # remainder
    .param int a
    .param int b
    $I0 = mod a, b
    .return ($I0)
.end

# XXX No strings.
.sub 'infix:+'     # add
    .param float a
    .param float b
    $N0 = a + b
    .return ($N0)
.end

# XXX No strings.
.sub 'infix:-'     # subtract
    .param pmc a
    .param pmc b
    $N0 = a
    $N1 = b
    $N2 = $N0 - $N1
    .return ($N2)
.end

# XXX Int only
.sub 'infix:<<'    # left shift
    .param int a
    .param int b
    $I0 = shl a, b
    .return ($I0)
.end

# XXX Int only
.sub 'infix:>>'    # right shift
    .param int a
    .param int b
    $I0 = shr a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:<'     # boolean less than
    .param pmc a
    .param pmc b
    $I0 = islt a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:>'     # boolean greater than
    .param pmc a
    .param pmc b
    $I0 = isgt a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:<='    # boolean less than or equal
    .param pmc a
    .param pmc b
    $I0 = isle a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:>='    # boolean greater than or equal
    .param pmc a
    .param pmc b
    $I0 = isge a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:=='    # boolean equal
    .param pmc a
    .param pmc b
    $I0 = iseq a, b
    .return ($I0)
.end

# XXX *ALL* operands
.sub 'infix:!='    # boolean not equal
    .param pmc a
    .param pmc b
    $I0 = isne a, b
    .return ($I0)
.end

.sub 'infix:eq'    # string equality
    .param string a
    .param string b
    $I0 = iseq a, b 
    .return ($I0)
.end

.sub 'infix:eq'    # string inequality
    .param pmc a
    .param pmc b
    $I0 = isne a, b 
    .return ($I0)
.end

# XXX Int only
.sub 'infix:&'     # bitwise AND
    .param int a
    .param int b
    $I0 = band a, b
    .return ($I0)
.end

# XXX int only
.sub 'infix:^'     # bitwise exclusive OR
    .param int a
    .param int b
    $I0 = bxor a, b
    .return ($I0)
.end

# XXX int only
.sub 'infix:|'     # bitwise OR
    .param int a
    .param int b
    $I0 = bor a, b
    .return ($I0)
.end

# Note: &&, ||, ?: will be handled in the TGE transformation.

# Functions are very similar to ops, so handle them similarly here.

# We have a bit of setup/teardown here to insure we return a TclFloat

# nullary 
.sub 'function:rand'
.end

# unary
.sub 'function:abs' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:abs' :multi (pmc)
    .param pmc a
    .local pmc b
    b = clone a
    b = neg b
    .return (b)
.end

.sub 'function:acos' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:acos' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = acos a
    ret = $N0
    .return (ret)
.end

.sub 'function:asin' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:asin' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = asin a
    ret = $N0
    .return (ret)
.end

.sub 'function:atan' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:atan' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = atan a
    ret = $N0
    .return (ret)
.end

.sub 'function:ceil' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:ceil' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = ceil a
    ret = $N0
    .return (ret)
.end

.sub 'function:cos' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:cos' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = cos a
    ret = $N0
    .return (ret)
.end

.sub 'function:cosh' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:cosh' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = cosh a
    ret = $N0
    .return (ret)
.end

.sub 'function:double' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:double' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    ret = a
    .return (ret)
.end

.sub 'function:exp' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:exp' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = exp a
    ret = $N0
    .return (ret)
.end

.sub 'function:floor' 
.end

.sub 'function:int' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:int' :multi (pmc)
    .param int a
    .return (a)
.end

.sub 'function:log' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:log' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = ln a
    ret = $N0
    .return (ret)
.end

.sub 'function:log10' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:log10' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = log10 a
    ret = $N0
    .return (ret)
.end

.sub 'function:round' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:round' :multi (pmc)
    .param float a
    if a < 0 goto neg

    $N0 = a + 0.5
    $I0 = $N0
    .return ($I0)
neg: 
    $N0 = a - 0.5
    $I0 = $N0
    .return ($I0)
.end

.sub 'function:sin' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sin' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = sin a
    ret = $N0
    .return (ret)
.end

.sub 'function:sinh' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sinh' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = sinh a
    ret = $N0
    .return (ret)
.end

.sub 'function:sqrt' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sqrt' :multi (pmc)
    .param float a
    .local pmc ret
    if a < 0 goto domain_error
    ret = new "TclFloat"
    $N0 = sqrt a
    ret = $N0
    .return (ret)

domain_error:
    .throw('domain error: argument not in valid range')
.end

.sub 'function:srand'
.end

.sub 'function:tan' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:tan' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = tan a
    ret = $N0
    .return (ret)
.end

.sub 'function:tanh' :multi (String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:tanh' :multi (pmc)
    .param float a
    .local pmc ret
    ret = new "TclFloat"
    $N0 = tanh a
    ret = $N0
    .return (ret)
.end

.sub 'function:wide'
.end

# binary
# atan2 | fmod | hypot | pow 

.sub 'function:fmod' :multi (String, pmc)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:fmod' :multi (pmc, String)
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:fmod' :multi (pmc, pmc)
    .param float a
    .param float b
    if b == 0 goto domain_error
    $N0 = a / b
    $I0 = $N0
    $N0 -= $I0 
    .local pmc ret
    ret = new "TclFloat"
    ret = $N0
    .return (ret)

 domain_error:
    .throw('domain error: argument not in valid range')
.end
