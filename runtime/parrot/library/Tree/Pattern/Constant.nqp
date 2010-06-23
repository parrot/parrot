#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Tree::Pattern::Constant is Tree::Pattern {
    method new ($value) {
        my $self := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };
        $self.value($value);
        $self;
    }

    method value ($value?) {
        self.attr("value", $value, pir::defined__IP($value));
    }

    method ACCEPTSEXACTLY ($node) {
        Tree::Pattern::Match.new(pir::iseq__IPP(self.value(), $node),
                                 $node);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
