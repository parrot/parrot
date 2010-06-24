#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT.pbc');
}

class PAST::Walker {
    our multi sub walk (PAST::Walker $walker, PAST::Node $node) {
        walkChildren($walker, $node);
    }

    our multi sub walk (PAST::Walker $walker, $node) {
        $node;
    }

    our multi sub walkChildren (PAST::Walker $walker, PAST::Node $node) {
        my $index := 0;
        my $max := pir::elements__IP($node);
        while ($index < $max) {
            walk($walker, $node[$index++]);
        }
    }

    method walk ($node) {
        walk(self, $node);
    }

    method walkChildren ($node) {
        walkChildren(self, $node);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
