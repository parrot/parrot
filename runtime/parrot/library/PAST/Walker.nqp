#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT.pbc');
    pir::load_bytecode('Tree/Walker.pbc');
}

class PAST::Walker is Tree::Walker { }

module Tree::Walker {
    our multi sub walk (PAST::Walker $walker, PAST::Node $node) {
        say('PAST::Walker, PAST::Node');
        walkChildren($walker, $node);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
