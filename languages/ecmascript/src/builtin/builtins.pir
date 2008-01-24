# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$


## Not sure what standard built-in library is for ECMAScript, but
## we need some output function for testing. For now this'll do.

.sub 'print'
    .param pmc args :slurpy
    .local pmc iter
    new iter, 'Iterator', args
  print_loop:
    unless iter goto end_print_loop
    $P1 = shift iter
    print $P1
    goto print_loop
  end_print_loop:
.end

## TODO: change this name into something obscure.
##
## constructor for a object literals. It takes advantages of
## the Parrot Calling Conventions using :slurpy and :named flags,
## meaning that the parameter C<fields> is a hash, which is kinda
## what we want. For now.
##
.sub 'ctor'
    .param pmc fields :slurpy :named
    .return (fields)
.end


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

.sub 'infix:='
    .param pmc lhs
    .param pmc rhs
    assign lhs, rhs
    .return (lhs)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
