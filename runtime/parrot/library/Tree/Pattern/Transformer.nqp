#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Transformer.pbc');
}

class Tree::Pattern::Transformer is Tree::Transformer {
    has $pattern;
    has $transform;

    has $depth;

    method new ($pattern, $transform, *%adverbs) {
        my $class := pir::getattribute__PPS(self.HOW(),
                                           'parrotclass');
        my $self := pir::new__PP($class);
        $self.depth(0);
        $self.pattern($pattern);
        $self.transform($transform);
        $self;
    }

    method depth ($depth?) {
        my $result;
        if pir::defined__IP($depth) {
            pir::setattribute(self, '$depth', $depth);
        }
        else {
            $result := pir::getattribute__PPS(self, '$depth');
        }
        $result;
    }

    method pattern ($pattern?) {
        my $result;
        if pir::defined__iP($pattern) {
            pir::setattribute(self, '$pattern', $pattern);
        }
        else {
            $result := pir::getattribute__PPs(self, '$pattern');
        }
        $result;
    }

    method transform ($transform?) {
        my $result;
        if pir::defined__iP($transform) {
            pir::setattribute(self, '$transform', $transform);
        }
        else {
            $result := pir::getattribute__PPs(self, '$transform');
        }
        $result;
    }

}

module Tree::Walker {
    our multi sub walk (Tree::Pattern::Transformer $walker,
                        Capture $node) {
        my $pattern := $walker.pattern();
        my $shouldTransform;
        if ($pattern ~~ Tree::Pattern) {
            $shouldTransform := $pattern.ACCEPTS($node, :pos($node));
        }
        else {
            $shouldTransform := $pattern.ACCEPTS($node);
        }
        my $result;
        if ($shouldTransform) {
            $result := $walker.transform()($shouldTransform);
        }
        else {
            $result := $node;
        }
        $walker.depth($walker.depth + 1);
        my $newChildren := walkChildren($walker, $result);
        replaceChildren($result, $newChildren);
        $walker.depth($walker.depth - 1);
        $result;
    }

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
