#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Transformer.pbc');
}

class PAST::Transformer is Tree::Transformer {
    our multi method walkable ($node) { 0; }
    our multi method walkable (PAST::Node $node) { 1; }
}

module Tree::Walker {
    our multi sub walkChildren (PAST::Transformer $walker, PAST::Var $var) {
        my $results := pir::new__PP(Capture);
        my $index := 0;
        my $max := pir::elements__IP($var);
        while ($index < $max) {
            $results[$index] := walk($walker, $var[$index]);
            $index++;
        }
        $results['viviself'] := $walker.walk($var.viviself)
          if $walker.walkable($var.viviself);
        $results['vivibase'] := $walker.walk($var.vivibase)
          if $walker.walkable($var.vivibase);
        $results;
    }

    our multi sub replaceChildren (PAST::Var $node, $newChildren) {
        $node := null;
        for $newChildren.list -> $child {
            pir::push($node, $child);
        }
        for $newChildren.hash {
            $node.attr($_.key, $_.value, 1);
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
