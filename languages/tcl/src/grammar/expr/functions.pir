# $Id$

=head1 NAME

src/grammar/expr/functions - [expr] function definitions

=head2 Nullary Functions

Functions are very similar to ops, so handle them similarly here.

=cut

.namespace

.sub 'function:rand'
.end

=head2 Unary Functions

=cut

.sub 'function:abs'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc b
    b = clone a
    b = neg b
    .return (b)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:acos'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = acos $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:asin'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = asin $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:atan'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = atan $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:ceil'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = ceil $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:cos'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = cos $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:cosh'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = cosh $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:double'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:exp'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = exp $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:floor' 
.end

.sub 'function:int'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    $I0 = a
    $P0 = new 'TclInt'
    $P0 = $I0
    
    .return ($P0)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:log'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh

    if a < 0 goto domain_error

    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = ln $N0
    ret = $N0
    .return (ret)

domain_error:
    .throw('domain error: argument not in valid range')

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:log10'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh

    if a < 0 goto domain_error

    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = log10 $N0
    ret = $N0
    .return (ret)

domain_error:
    .throw('domain error: argument not in valid range')

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:round'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    if a < 0 goto neg

    $N0 = a
    $N0 += 0.5
    $I0 = $N0
    .return ($I0)
neg: 
    $N0 = a
    $N0 -= 0.5
    $I0 = $N0
    .return ($I0)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sin'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = sin $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sinh'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = sinh $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:sqrt'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    if a < 0 goto domain_error
    ret = new "TclFloat"
    $N0 = a
    $N0 = sqrt $N0
    ret = $N0
    .return (ret)

domain_error:
    .throw('domain error: argument not in valid range')

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:srand'
.end

.sub 'function:tan'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = tan $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:tanh'
    .param pmc a
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
    clear_eh
    
    .local pmc ret
    ret = new "TclFloat"
    $N0 = a
    $N0 = tanh $N0
    ret = $N0
    .return (ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:wide'
.end

=head2 Binary Functions

=cut

.sub 'function:atan2'
    .param pmc a
    .param pmc b
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh
    
    $N0 = a
    $N1 = b
    $N0 = atan $N0, $N1
    .local pmc ret
    ret = new 'TclFloat'
    ret = $N0
    .return(ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:fmod'
    .param pmc a
    .param pmc b
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh
    
    if b == 0 goto domain_error 
    $N0 = a
    $N1 = b
    $N0 = $N0 % $N1
    .local pmc ret
    ret = new "TclFloat"
    ret = $N0
    .return (ret)

 domain_error:
    .throw('domain error: argument not in valid range')

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:hypot'
    .param pmc a
    .param pmc b
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh
    
    $N0 = a
    $N1 = b
    $N0 = pow $N0, 2
    $N1 = pow $N1, 2
    
    $N0 = $N0 + $N1
    $N0 = sqrt $N0
    
    .local pmc ret
    ret = new 'TclFloat'
    ret = $N0
    .return(ret)

is_string:
    .throw("argument to math function didn't have numeric value")
.end

.sub 'function:pow'
    .param pmc a
    .param pmc b
    
    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh

    $N0 = a
    $N1 = b
    $N0 = pow $N0, $N1 # pow only exists as pow_n_n_n
    $P0 = new 'TclFloat'
    $P0 = $N0
    .return($P0)

is_string:
    .throw("argument to math function didn't have numeric value")
.end
