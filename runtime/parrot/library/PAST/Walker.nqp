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
class PAST::Walker is Tree::Walker {
    our multi method walkable ($node) { 0; }
    our multi method walkable (PAST::Node $node) { 1; }
}

module Tree::Walker {
    our multi sub walk (PAST::Walker $walker, Integer $i) { }
    our multi sub walk (PAST::Walker $walker, String $s) { }

    our multi sub walkChildren (PAST::Walker $walker, PAST::Var $var) {
        my $index := 0;
        my $max := pir::elements__IP($var);
        my $child;
        until ($index == $max) {
            walk($walker, $var[$index++]);
        }
        walk($walker, $var.viviself) if $walker.walkable(viviself);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
