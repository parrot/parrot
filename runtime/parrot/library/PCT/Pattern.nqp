#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Pattern.pbc');
    pir::load_bytecode('PCT.pbc');
}

module PCT::Node {
    method match ($pattern, *%options) {
        $pattern.ACCEPTS(self, |%options);
    }

    method subst ($pattern, *%options) {
        $pattern.transform(self, |%options);
    }
}

class PCT::Pattern is Tree::Pattern {

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
