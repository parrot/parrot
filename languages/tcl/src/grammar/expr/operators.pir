# $Id$

=head1 NAME

src/grammar/expr/operators.pir - [expr] operator definitions.

=head2 Prefix Operators

=cut

.HLL 'Tcl', ''
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

=head2 Infix Operators

&&, || (and ?:) are handled during the PGE transformation stage.

=cut

# this is used to make double-quoted strings work
# (they're a series of captures that need to be concatenated)
.sub 'infix:concat'
    .param pmc a
    .param pmc b

    $S0 = a
    $S1 = b
    $S0 = $S0 . $S1

    $P0 = new 'TclString'
    $P0 = $S0
    .return($P0)
.end

.sub 'infix:*'  
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
      $P0 = new 'TclFloat'
      $P0 = mul a, b
    clear_eh
    .return ($P0)

is_string:
    .throw("can't use non-numeric string as operand of \"*\"")
.end

.sub 'infix:/'
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
      $P0 = new 'TclFloat'
      $P0 = div a, b
    clear_eh
    .return($P0)

is_string:
    .throw("can't use non-numeric string as operand of \"/\"")
.end

.sub 'infix:%'
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh
    
    $I0 = isa a, 'TclFloat'
    if $I0 goto is_float
    $I0 = isa b, 'TclFloat'
    if $I0 goto is_float

    $P0 = new 'TclInt'
    $P0 = mod a, b
    .return($P0)

is_string:
    .throw("can't use non-numeric string as operand of \"%\"")

is_float:
    .throw("can't use floating-point value as operand of \"%\"")
.end

.sub 'infix:+'
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
      $P0 = new 'TclFloat'
      $P0 = a + b
    clear_eh
    .return($P0)

is_string:
    .throw("can't use non-numeric string as operand of \"+\"")
.end

.sub 'infix:-'
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
      $P0 = new 'TclFloat'
      $P0 = a - b
    clear_eh
    .return($P0)

is_string:
    .throw("can't use non-numeric string as operand of \"-\"")
.end

# left shift
.sub 'infix:<<'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \"<<\"")
.end

.sub 'infix:<<'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \"<<\"")
.end

.sub 'infix:<<'     :multi(Integer, Integer)
    .param int a
    .param int b

    $I0 = shl a, b
    .return($I0)
.end

.sub 'infix:<<'     :multi(pmc, pmc)
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh

    $I0 = isa a, 'Float'
    if $I0 goto is_float
    $I0 = isa b, 'Float'
    if $I0 goto is_float

    $I0 = a
    $I1 = b
    $I0 = shl $I0, $I1
    .return ($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"<<\"")

is_float:
  .throw ("can't use floating-point value as operand of \"<<\"")
.end

# right shift
.sub 'infix:>>'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \">>\"")
.end

.sub 'infix:>>'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \">>\"")
.end

.sub 'infix:>>'     :multi(Integer, Integer)
    .param int a
    .param int b
    $I0 = shr a, b
    .return ($I0)
.end

.sub 'infix:>>'     :multi(pmc, pmc)
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      a = __number(a)
      b = __number(b)
    clear_eh

    $I0 = isa a, 'Float'
    if $I0 goto is_float
    $I0 = isa b, 'Float'
    if $I0 goto is_float

    $I0 = a
    $I1 = b
    $I0 = shr $I0, $I1
    .return ($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \">>\"")

is_float:
  .throw ("can't use floating-point value as operand of \">>\"")
.end

# *ALL* operands
.sub 'infix:<'     # boolean less than
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'
    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = islt $P0, $P1
    clear_eh
    .return ($I0)

is_string:
    $I0 = islt a, b
    .return($I0)
.end

# *ALL* operands
.sub 'infix:>'     # boolean greater than
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'
    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = isgt $P0, $P1
    clear_eh
    .return($I0)

is_string:
    $I0 = isgt a, b
    .return ($I0)
.end

# *ALL* operands
.sub 'infix:<='    # boolean less than or equal
    .param pmc a
    .param pmc b

    .local pmc __number
    __number = get_root_global ['_tcl'], '__number'

    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = isle $P0, $P1
    clear_eh
    .return($I0)

is_string:
    $I0 = isle a, b
    .return ($I0)
.end

# *ALL* operands
.sub 'infix:>='    # boolean greater than or equal
    .param pmc a
    .param pmc b

    .local pmc __number
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']

    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = isge $P0, $P1
    clear_eh
    .return($I0)

is_string:
    $I0 = isge a, b
    .return ($I0)
.end

# *ALL* operands
.sub 'infix:=='    # boolean equal
    .param pmc a
    .param pmc b

    .local pmc __number
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']

    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = iseq $P0, $P1
    clear_eh
    .return($I0)

is_string:
    $I0 = iseq a, b
    .return ($I0)
.end

# *ALL* operands
.sub 'infix:!='    # boolean not equal
    .param pmc a
    .param pmc b

    .local pmc __number
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']

    push_eh is_string
      $P0 = __number(a)
      $P1 = __number(b)
      $I0 = isne $P0, $P1
    clear_eh
    .return($I0)

is_string:
    $I0 = isne a, b
    .return ($I0)
.end

.sub 'infix:eq'    # string equality
    .param string a
    .param string b
    $I0 = iseq a, b 
    .return ($I0)
.end

.sub 'infix:ne'    # string inequality
    .param pmc a
    .param pmc b
    $I0 = isne a, b 
    .return ($I0)
.end


# bitwise AND
.sub 'infix:&'     :multi(String, String)
  .param pmc a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
    b = __integer(b)
  clear_eh

  $I0 = a
  $I1 = b
  $I0 = band $I0, $I1
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(String, Integer)
  .param pmc a
  .param int b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
  clear_eh

  $I0 = a
  $I0 = band $I0, b
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(Integer, String)
  .param int a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    b = __integer(b)
  clear_eh

  $I0 = b
  $I0 = band a, $I0
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(Float, String)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        b = __integer(b)
    clear_eh
    .throw("can't use floating-point value as operand of \"&\"")

is_string:
    .throw("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(String, Float)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        a = __integer(a)
    clear_eh
    .throw("can't use floating-point value as operand of \"&\"")

is_string:
    .throw("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \"&\"")
.end

.sub 'infix:&'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \"&\"")
.end

.sub 'infix:&'     :multi(Integer, Integer)
    .param int a
    .param int b
    $I0 = band a, b
    .return ($I0)
.end


# bitwise exclusive OR 
.sub 'infix:^'     :multi(String, String)
  .param pmc a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
    b = __integer(b)
  clear_eh

  $I0 = a
  $I1 = b
  $I0 = bxor $I0, $I1
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(String, Integer)
  .param pmc a
  .param int b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
  clear_eh

  $I0 = a
  $I0 = bxor $I0, b
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(Integer, String)
  .param int a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    b = __integer(b)
  clear_eh

  $I0 = b
  $I0 = bxor a, $I0
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(Float, String)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        b = __integer(b)
    clear_eh
    .throw("can't use floating-point value as operand of \"^\"")

is_string:
    .throw("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(String, Float)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        a = __integer(a)
    clear_eh
    .throw("can't use floating-point value as operand of \"^\"")

is_string:
    .throw("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \"^\"")
.end

.sub 'infix:^'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \"^\"")
.end

.sub 'infix:^'     :multi(Integer, Integer)
    .param int a
    .param int b
    $I0 = bxor a, b
    .return ($I0)
.end


# bitwise OR
.sub 'infix:|'     :multi(String, String)
  .param pmc a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
    b = __integer(b)
  clear_eh

  $I0 = a
  $I1 = b
  $I0 = bor $I0, $I1
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(String, Integer)
  .param pmc a
  .param int b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    a = __integer(a)
  clear_eh

  $I0 = a
  $I0 = bor $I0, b
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(Integer, String)
  .param int a
  .param pmc b

  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'

  push_eh is_string
    b = __integer(b)
  clear_eh

  $I0 = b
  $I0 = bor a, $I0
  .return($I0)

is_string:
  .throw ("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(Float, String)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        b = __integer(b)
    clear_eh
    .throw("can't use floating-point value as operand of \"|\"")

is_string:
    .throw("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(String, Float)
    .param pmc a
    .param pmc b

    .local pmc __integer
    __integer = get_root_global ['_tcl'], '__integer'

    push_eh is_string
        a = __integer(a)
    clear_eh
    .throw("can't use floating-point value as operand of \"|\"")

is_string:
    .throw("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \"|\"")
.end

.sub 'infix:|'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \"|\"")
.end

.sub 'infix:|'     :multi(Integer, Integer)
    .param int a
    .param int b
    $I0 = bor a, b
    .return ($I0)
.end


.sub 'infix:in'
    .param pmc elem
    .param pmc list

    .local pmc __list
    $P0 = get_root_namespace
    __list = $P0['_tcl'; '__list']

    .local pmc iter
    list = __list(list)
    iter = new .Iterator, list
loop:
    unless iter goto false
    $P0 = shift iter
    $I0 = 'infix:=='(elem, $P0)
    if $I0 goto true
    goto loop
true:
    .return(1)
false:
    .return(0)
.end

.sub 'infix:ni'
    .param pmc elem
    .param pmc list

    .local pmc __list
    $P0 = get_root_namespace
    __list = $P0['_tcl'; '__list']

    .local pmc iter
    list = __list(list)
    iter = new .Iterator, list
loop:
    unless iter goto true
    $P0 = shift iter
    $I0 = 'infix:=='(elem, $P0)
    if $I0 goto false
    goto loop
true:
    .return(1)
false:
    .return(0)
.end
