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

=cut

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

# XXX *ALL* operands
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

# XXX Note: &&, ||, ?: will be handled in the TGE transformation.
