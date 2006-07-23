# $Id$

=head1 NAME

src/grammar/expr/operators.pir - [expr] operator definitions.

=head2 Prefix Operators

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

=head2 Infix Operators

&&, || (and ?:) are handled during the PGE transformation stage.

=cut

# multiply
.sub 'infix:*'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"*\"")
.end

.sub 'infix:*'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"*\"")
.end

.sub 'infix:*'     :multi(pmc, pmc)   
    .param pmc a
    .param pmc b
    $P0 = mul a, b
    .return ($P0)
.end

# divide
.sub 'infix:/'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"/\"")
.end

.sub 'infix:/'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"/\"")
.end

.sub 'infix:/'     :multi(pmc, pmc)
    .param float a
    .param float b
    $N0 = div a, b
    .return ($N0)
.end


# remainder
.sub 'infix:%'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"%\"")
.end

.sub 'infix:%'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"%\"")
.end

.sub 'infix:%'     :multi(Float, pmc)
  .throw ("can't use floating-point value as operand of \"%\"")
.end

.sub 'infix:%'     :multi(pmc, Float)
  .throw ("can't use floating-point value as operand of \"%\"")
.end

.sub 'infix:%'     :multi(Integer, Integer)
    .param int a
    .param int b
    $I0 = mod a, b
    .return ($I0)
.end

# add
.sub 'infix:+'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"+\"")
.end

.sub 'infix:+'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"+\"")
.end

.sub 'infix:+'     :multi(pmc, pmc)
    .param float a
    .param float b
    $N0 = a + b
    .return ($N0)
.end

# subtract
.sub 'infix:-'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"-\"")
.end

.sub 'infix:-'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"-\"")
.end

.sub 'infix:-'     :multi(pmc, pmc)
    .param pmc a
    .param pmc b
    $N0 = a
    $N1 = b
    $N2 = $N0 - $N1
    .return ($N2)
.end

# left shift
.sub 'infix:<<'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"<<\"")
.end

.sub 'infix:<<'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"<<\"")
.end

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
    .return ($I0)
.end

# right shift
.sub 'infix:>>'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \">>\"")
.end

.sub 'infix:>>'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \">>\"")
.end

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

# *ALL* operands
.sub 'infix:<'     # boolean less than
    .param pmc a
    .param pmc b

    .local pmc __number
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']
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
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']
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
    $P0 = get_root_namespace
    __number = $P0['_tcl'; '__number']

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
.sub 'infix:&'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"&\"")
.end

.sub 'infix:&'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"&\"")
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
.sub 'infix:^'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"^\"")
.end

.sub 'infix:^'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"^\"")
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
.sub 'infix:|'     :multi(String, pmc)
  .throw ("can't use non-numeric string as operand of \"|\"")
.end

.sub 'infix:|'     :multi(pmc, String)
  .throw ("can't use non-numeric string as operand of \"|\"")
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

=cut
