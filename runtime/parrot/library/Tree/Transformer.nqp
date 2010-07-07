#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Tree::Transformer {
    method walk ($node) {
        Tree::Walker::walk(self, $node);
    }

    method walkChildren ($node) {
        Tree::Walker::walkChildren(self, $node);
    }
}

module Tree::Walker {
    our multi sub walk (Tree::Transformer $walker, Capture $node) {
        my $result := $node;
        replaceChildren($result, walkChildren($walker, $node));
        $result;
    }

    our multi sub walk (Tree::Transformer $walker, $node) {
        $node; # Don't touch things that we don't know what to do with.
    }

    our multi sub walkChildren (Tree::Transformer $walker,
                                Capture $node) {
        my @results;
        my $index := 0;
        my $max := pir::elements__IP($node);
        while ($index < $max) {
            @results[$index] := walk($walker, $node[$index]);
            $index++;
        }
        @results;
    }

    our sub replaceChildren ($node, $newChildren) {
        my $index := pir::elements__IP($node);
        while ($index > 0) {
            pir::pop__PP($node);
            $index--;
        }
        my $max := pir::elements__IP($newChildren);
        while ($index < $max) {
            pir::push($node, $newChildren[$index])
                if pir::defined__IP($newChildren[$index]);
            $index++;
        }
        null;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
