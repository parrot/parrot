#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('Tree/Pattern.pbc');
    pir::load_bytecode('PAST/Transformer.pbc');
}

class PAST::Pattern is Tree::Pattern {
    method transform ($past, $transform) {
        my &transSub;
        if ($transform ~~ PAST::Transformer) {
            &transSub := sub ($/) { $transformer.walk($/.from()); };
        } elsif (pir::does__iPS($transform, 'invokable')) {
            &transSub := $transform;
        } else {
            pir::die('$transform must be invokable or a PAST::Transformer.');
        }
        my $transformer :=
          PAST::Pattern::Transformer.new(self, &transSub);
        $transformer.walk($past);
    }
}

module PAST::Node {
    method match ($pattern, *%options) {
        $pattern.ACCEPTS(self, |%options);
    }

    method subst ($pattern, *%options) {
        $pattern.transform(self, |%options);
    }
}

INIT {
    pir::load_bytecode('PAST/Pattern/Node.pbc');

    pir::load_bytecode('PAST/Pattern/Transformer.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
