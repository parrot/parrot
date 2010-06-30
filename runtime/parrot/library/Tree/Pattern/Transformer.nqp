#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Transformer.pbc');
}

class Tree::Pattern::Transformer is Tree::Transformer {
    has $descend_until;
    has $min_depth;
    has $pattern;
    has $transform;

    has $depth;

    method new ($pattern, $transform, *%adverbs) {
        my $class := pir::getattribute__PPS(self.HOW(),
                                           'parrotclass');
        my $self := pir::new__PP($class);
        $self.depth(0);
        my $descend_until :=
          (%adverbs<descend_until>
           ?? Tree::Pattern::patternize(%adverbs<descend_until>)
           !! 0);
        $self.descend_until($descend_until);
        $self.min_depth(%adverbs<min_depth> || 0);
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

    method descend_until ($descend_until?) {
        my $result;
        if pir::defined__IP($descend_until) {
            pir::setattribute(self, '$descend_until', $descend_until);
        }
        else {
            $result := pir::getattribute__PPS(self, '$descend_until');
        }
        $result;
    }

    method min_depth ($min_depth?) {
        my $result;
        if pir::defined__IP($min_depth) {
            pir::setattribute(self, '$min_depth', $min_depth);
        }
        else {
            $result := pir::getattribute__PPS(self, '$min_depth');
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
        if ($walker.depth < $walker.min_depth) {
            $shouldTransform := 0;
        }
        elsif ($pattern ~~ Tree::Pattern) {
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
        
        my $shouldDescend;
        if (!$walker.descend_until) {
            $shouldDescend := 1;
        }
        elsif ($walker.descend_until ~~ Tree::Pattern) {
            $shouldDescend := $walker.descend_until.ACCEPTS($node,
                                                            :pos($node));
        }
        else {
            $shouldDescend := $walker.descend_until.ACCEPTS($node);
        }

        if ($shouldDescend) {
            $walker.depth($walker.depth + 1);
            my $newChildren := walkChildren($walker, $result);
            replaceChildren($result, $newChildren);
            $walker.depth($walker.depth - 1);
        }
        $result;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
