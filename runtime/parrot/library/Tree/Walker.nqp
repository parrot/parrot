#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Tree::Walker {
    our multi sub walk (Tree::Walker $walker, Capture $node) {
        walkChildren($walker, $node);
    }

    our multi sub walkChildren (Tree::Walker $walker, Capture $tree) {
        my $index := 0;
        my $len := pir::elements__iP($tree);
        while ($index < $len) {
            walk($walker, $tree[$index]);
            $index++;
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
