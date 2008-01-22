# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$


## Not sure what standard built-in library is for ECMAScript, but
## we need some output function for testing. For now this'll do.

.sub 'print'
    .param pmc arg
    print arg
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
