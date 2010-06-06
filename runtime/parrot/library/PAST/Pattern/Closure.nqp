#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class PAST::Pattern::Closure is PAST::Pattern {

    method new (&code) {
        my $self := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };
        $self.code(&code);
        $self;
    }

    method code (&code?) {
        self.attr("code", &code, pir::defined__IP(&code));
    }

    method ACCEPTS ($node) {
        PAST::Pattern::Match.new(self.code()($node),
                                 $node);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
