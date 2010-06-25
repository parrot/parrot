#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Walker.pbc');
}

class PAST::Transformer is PAST::Walker { }

module Tree::Walker {
    our multi sub walk (PAST::Transformer $walker, PAST::Node $node) {
        my $result := $node;
        replaceChildren($result, walkChildren($walker, $node));
        $result;
    }

    our multi sub walk (PAST::Transformer $walker, $node) {
        $node; # Don't touch things that we don't know what to do with.
    }

    our multi sub walkChildren (PAST::Transformer $walker,
                                PAST::Node $node) {
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
