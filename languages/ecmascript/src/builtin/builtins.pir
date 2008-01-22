# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$


## Not sure what standard built-in library is for ECMAScript, but
## we need some output function for testing. For now this'll do.

.sub 'print'
    .param pmc arg
    print arg
.end
