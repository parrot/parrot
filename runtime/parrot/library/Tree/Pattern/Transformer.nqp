#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Transformer.pbc');
}

class Tree::Pattern::Transformer is PAST::Transformer {
    has $pattern;
    has $transform;

    method new ($pattern?, $transform?) {
        my $class := pir::getattribute__PPS(self.HOW(),
                                           'parrotclass');
        my $self := pir::new__PP($class);
        $self.pattern($pattern);
        $self.transform($transform);
        $self;
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

module PAST::Walker {
    our multi sub walk (Tree::Pattern::Transformer $walker,
                    PAST::Node $node) {
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
        my $newChildren := walkChildren($walker, $result);
        replaceChildren($result, $newChildren);
        $result;
    }

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
