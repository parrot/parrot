#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Transformer.pbc');
}

# This class doesn't differ in behavior from Tree::Transformer, but having
# it provides both a specification of what you expect to be transforming
# and a way to easily change its behavior if that becomes necessary in the
# future.
class PAST::Transformer is Tree::Transformer { }

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
