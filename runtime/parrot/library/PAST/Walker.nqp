#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT.pbc');
    pir::load_bytecode('Tree/Walker.pbc');
}

# Doesn't actually have any unique behavior, but separating it out is good
# for readability, documentation, and in case we end up needing to change
# its behavior later.
class PAST::Walker is Tree::Walker { }

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
