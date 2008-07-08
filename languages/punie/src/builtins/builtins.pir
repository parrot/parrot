.namespace []

.sub 'infix:=='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = iseq $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:!='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isne $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:<'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = islt $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:>'
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isgt $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:<='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isle $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:>='
    .param pmc a
    .param pmc b
    $I1 = a
    $I2 = b
    $I3 = isge $I1, $I2
    $P1 = new 'Integer'
    $P1 = $I3
    .return($P1)
.end

.sub 'infix:eq'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = iseq $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:ne'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isne $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:lt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = islt $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:gt'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isgt $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:le'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isle $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:ge'
    .param pmc a
    .param pmc b
    $S1 = a
    $S2 = b
    $I1 = isge $S1, $S2
    $P1 = new 'Integer'
    $P1 = $I1
    .return($P1)
.end

.sub 'infix:x'
    .param string a
    .param int b
    $S0 = repeat a, b
    .return ($S0)
.end

.sub 'infix:<<'
    .param int a
    .param int b
    $I0 = shl a, b
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end

.sub 'infix:>>'
    .param int a
    .param int b
    $I0 = shr a, b
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end

.sub 'infix:&'
    .param int a
    .param int b
    $I0 = band a, b
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end

.sub 'infix:|'
    .param int a
    .param int b
    $I0 = bor a, b
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end

.sub 'infix:^'
    .param int a
    .param int b
    $I0 = bxor a, b
    $P0 = new 'Integer'
    $P0 = $I0
    .return ($P0)
.end

.sub 'infix:..'
    .param pmc a
    .param pmc b
    $P0 = a
    .return ($P0)
.end

## autoincrement
.sub 'postfix:++'
    .param pmc a
    $P0 = clone a
    inc a
    .return ($P0)
.end

.sub 'postfix:--'
    .param pmc a
    $P0 = clone a
    dec a
    .return ($P0)
.end


.sub 'prefix:++'
    .param pmc a
    inc a
    .return (a)
.end


.sub 'prefix:--'
    .param pmc a
    dec a
    .return (a)
.end

.sub 'prefix:-'
    .param pmc a
    $N0 = a
    $N0 = neg $N0
    .return ($N0)
.end

## not implemented yet!
.sub 'prefix:~'
    .param pmc a
    .return (a)
.end

.sub 'prefix:!'
    .param pmc a
    not $P0, a
    .return ($P0)
.end

.sub 'infix:,'
    .param pmc args            :slurpy
    .return (args)
.end

.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new 'Iterator', list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop
  iter_end:
    .return (1)
.end

.sub 'printf'
.end

.sub 'system'
.end

.sub'unlink'
.end

.sub 'kill'
.end

.sub 'exec'
.end


.sub 'chop'
    .param pmc expr
    $S0 = expr
    chopn $S0, 1
    .return ($S0)
.end

.sub 'pop'
    .param pmc arr
    $P0 = pop arr
    .return ($P0)
.end

.sub 'push'
    .param pmc arr
    .param pmc exp
    push arr, exp
.end

.sub 'unshift'
    .param pmc arr
    .param pmc exp
    unshift arr, exp
.end


.sub 'shift'
    .param pmc arr
    $P0 = shift arr
    .return ($P0)
.end

.sub 'die'
    .param pmc expr
    die expr
.end

.sub 'exit'
    .param int expr
    exit expr
.end

.sub 'eval'
    .param pmc expr

.end


## func0 built-in functions

.sub 'fork'
.end

.sub 'time'
.end

.sub 'times'
.end

## func1 built-in functions

.sub 'exp'
    .param num arg
    exp $N0, arg
    .return ($N0)
.end

.sub 'gmtime'
    .param pmc arg
.end

.sub 'hex'
    .param pmc arg
.end

.sub 'int'
    .param num arg
    floor $I0, arg
    .return ($I0)
.end

.sub 'length'
    .param string arg
    length $I0, arg
    .return ($I0)
.end

.sub 'localtime'
    .param pmc arg
.end

.sub 'log'
    .param num arg
    ln $N0, arg
    .return ($N0)
.end

.sub 'ord'
    .param pmc arg
.end

.sub 'oct'
    .param pmc arg
.end

.sub 'sqrt'
    .param num arg
    sqrt $N0, arg
    .return ($N0)
.end

.sub 'umask'
    .param pmc arg
.end

## func2 built-in functions

.sub 'crypt'
    .param pmc arg1
    .param pmc arg2
.end

.sub 'index'
    .param pmc arg1
    .param pmc arg2
.end

.sub 'link'
    .param pmc arg1
    .param pmc arg2
.end

.sub 'rename'
    .param pmc arg1
    .param pmc arg2
.end

## func3 built-in functions

.sub 'substr'
    .param pmc arg1
    .param pmc arg2
    .param pmc arg3
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

