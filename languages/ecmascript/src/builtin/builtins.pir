# Copyright (C) 2005-2008, Parrot Foundation.
# $Id$

.include 'except_severity.pasm'

## Not sure what standard built-in library is for ECMAScript, but
## we need some output function for testing. For now this'll do.
## Separate items with an space, as the js shell in SpiderMonkey do.

.sub 'print'
    .param pmc args :slurpy
    .local pmc iter
    new iter, 'Iterator', args
    unless iter goto end_print_loop
  print_loop:
    $P1 = shift iter
    print $P1
    unless iter goto end_print_loop
    print ' '
    goto print_loop
  end_print_loop:
    print "\n"
.end

.sub 'quit'
    .param pmc args :slurpy
    .local int nargs, retcode
    retcode = 0
    nargs = args
    unless nargs goto done
    retcode = args [0]
done:
    # Severity doomed used to bypass the catching done
    # by the default HLL compiler.
    die .EXCEPT_DOOMED, retcode
.end

.sub 'readline'
    .param pmc unused :slurpy
    .local pmc stdin
    stdin = getstdin
    .local string line
    line = readline stdin
    .return(line)
.end

.sub 'version'
    .param pmc version :optional
    .param int has_version :opt_flag

    $P1 = get_global '+$VERSION'
    if_null $P1, unnullit
    unless has_version goto ret
    set_global '+$VERSION', version
  ret:
    .return ($P1)
  unnullit:
#    $P1 = new 'Integer'
    $P1 = box 0
    set_global '+$VERSION', $P1
    .return ($P1)
.end



## constructor for a object literals. It takes advantages of
## the Parrot Calling Conventions using :slurpy and :named flags,
## meaning that the parameter C<fields> is a hash, which is kinda
## what we want. For now.
##
.sub 'Object'
    .param pmc fields :slurpy :named
    .return (fields)
.end


#.sub 'Array'
#    .param pmc args :slurpy
#    $P0 = new 'Array'
#    .return ($P0)
#.end

.sub __load :init :anon
    newclass $P0, ['ECMAScript';'Object']
    newclass $P1, ['ECMAScript';'Array']
.end

.namespace ['ECMAScript';'Object']



.namespace ['ECMAScript';'Array']

.sub 'Put' :method
   .param pmc propname
   .param pmc value
   $I0 = self.'CanPut'(propname)
   unless $I0 goto stop

 stop:
   .return()
.end

.sub 'CanPut' :method
    .param pmc propname
.end

.sub 'Get' :method
    .param pmc propname
.end

.namespace []

## built-in functions
##

## probably add :vtable flag to these:
##
##.sub 'ToString' :multi(num)
##    .param num arg
##    #$P0 = new 'String'
##    $S0 = arg
##    .return ($S0)
##.end
##
##.sub 'ToString' :multi(int)
##    .param int arg
##    #$P0 = new 'String'
##    $S0 = arg
##    .return ($S0)
##.end
##
##.sub 'ToString' :multi(string)
##    .param string arg
##    .return (arg)
##.end
##
##.sub 'ToString' :multi(_)
##    .param pmc arg
##    $S0 = arg
##    .return ($S0)
##.end



## built-in operators
##

.sub 'prefix:?' :multi(_)
    .param pmc a
    if a goto a_true
    $P0 = get_hll_global ['JSBoolean'], 'false'
    .return ($P0)
  a_true:
    $P0 = get_hll_global ['JSBoolean'], 'true'
    .return ($P0)
.end

.sub 'infix:='
    .param pmc lhs
    .param pmc rhs
    assign lhs, rhs
    .return (lhs)
.end

.sub 'infix:+='
    .param pmc lhs
    .param pmc rhs
    add lhs, rhs
    .return (lhs)
.end

.sub 'infix:-='
    .param pmc lhs
    .param pmc rhs
    sub lhs, rhs
    .return (lhs)
.end

.sub 'infix:*='
    .param pmc lhs
    .param pmc rhs
    mul lhs, rhs
    .return (lhs)
.end

.sub 'infix:/='
    .param pmc lhs
    .param pmc rhs
    div lhs, rhs
    .return (lhs)
.end

.sub 'infix:%='
    .param pmc lhs
    .param pmc rhs
    mod lhs, rhs
    .return (lhs)
.end









## postfix operators
##
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

## infix operators
##

#.sub 'infix:||'
#    .param pmc left
#    .param pmc right
#.end
#
#
#.sub 'infix:&&'
#    .param pmc left
#    .param pmc right
#.end


.sub 'infix:|'
    .param pmc left
    .param pmc right
    $I1 = left
    $I2 = right
    bor $I0, $I1, $I2
    .return ($I0)
.end


.sub 'infix:^'
    .param pmc left
    .param pmc right
    $I1 = left
    $I2 = right
    bxor $I0, $I1, $I2
    .return ($I0)
.end


.sub 'infix:&'
    .param pmc left
    .param pmc right
    $I1 = left
    $I2 = right
    band $I0, $I1, $I2
    .return ($I0)
.end


.sub 'infix:=='
    .param pmc left
    .param pmc right
    iseq $I0, left, right
    .tailcall 'prefix:?'($I0)
.end


.sub 'infix:!='
    .param pmc left
    .param pmc right
    isne $I0, left, right
    .return ($I0)
.end


.sub 'infix:==='
    .param pmc left
    .param pmc right
.end


.sub 'infix:!=='
    .param pmc left
    .param pmc right
.end


.sub 'infix:<'
    .param pmc left
    .param pmc right
    $I0 = islt left, right
    .return ($I0)
.end


.sub 'infix:>'
    .param pmc left
    .param pmc right
    $I0 = isgt left, right
    .return ($I0)
.end

.sub 'infix:<='
    .param pmc left
    .param pmc right
    $I0 = isle left, right
    .return ($I0)
.end


.sub 'infix:>='
    .param pmc left
    .param pmc right
    $I0 = isge left, right
    .return ($I0)
.end


.sub 'infix:instanceof'
    .param pmc left
    .param pmc right
.end


.sub 'infix:in'
    .param pmc left
    .param pmc right
.end


.sub 'infix:<<'
    .param pmc left
    .param pmc right
.end


.sub 'infix:>>'
    .param pmc left
    .param pmc right
.end


.sub 'infix:>>>'
    .param pmc left
    .param pmc right
.end


## prefix operators
##
.sub 'prefix:delete'
    .param pmc op
.end


.sub 'prefix:void'
    .param pmc op
.end

.sub 'prefix:typeof'
    .param pmc op
    $S0 = typeof op

    $S1 = 'unknown'
    ne $S0, 'Sub', n1
    $S1 = 'function'
    n1:

    .return ($S1)
.end

.sub 'prefix:+'
    .param pmc op
    $N0 = op
    .return ($N0)
.end

.sub 'prefix:-'
    .param pmc op
    $N0 = op
    neg $N0
    .return ($N0)
.end

.sub 'prefix:++'
    .param pmc op
    inc op
    .return (op)
.end

.sub 'prefix:--'
    .param pmc op
    dec op
    .return (op)
.end

.sub 'prefix:~'
    .param pmc op
    bnot $P0, op
    .return ($P0)
.end

.sub 'prefix:!'
    .param pmc op
    istrue $I0, op
    not $I0
    .return ($I0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
