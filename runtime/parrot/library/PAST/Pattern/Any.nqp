#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class PAST::Pattern::Any is PAST::Pattern {
    method new (*@_) {
        my $self := Q:PIR {
            $P0 = self.'HOW'()
            $P0 = getattribute $P0, 'parrotclass'
            %r = new $P0
        };
        my $index := 0;
        for @_ {
            $self[$index++] := PAST::Pattern::patternize($_);
        }
        $self;
    }

    method ACCEPTSEXACTLY ($node) {
        my $index := 0;
        my $max := pir::elements(self);
        my $/;
        while ($index < $max) {
            if ($/ := self[$index].ACCEPTS($node, :p($node))) {
                return $/;
            }
            $index++;
        }
        PAST::Pattern::Match.new(0);
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
