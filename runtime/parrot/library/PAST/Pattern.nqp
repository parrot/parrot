#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class PAST::Pattern is Capture {
    sub patternize ($value) {
        unless (pir::can__IPS($value, 'ACCEPTS')) {
            if (pir::isa__IPP($value, Sub)) {
                $value := PAST::Pattern::Closure.new($value);
            } else {
                $value := PAST::Pattern::Constant.new($value);
            }
        }
        $value;
    }

    method attr ($name, $value, $has_value) {
        my $result;
        if ($has_value) {
            self{$name} := $value;
        } else {
            $result := self{$name};
        }
        $result;
    }

    method transform ($past, $transform) {
        my &transSub;
        if ($transform ~~ PAST::Transformer) {
            &transSub := sub ($node) { $transformer.walk($node); };
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



INIT {
    pir::load_bytecode('PAST/Pattern/Match.pbc');

    pir::load_bytecode('PAST/Pattern/Closure.pbc');
    pir::load_bytecode('PAST/Pattern/Constant.pbc');
    pir::load_bytecode('PAST/Pattern/Node.pbc');

    pir::load_bytecode('PAST/Pattern/augment-past.pbc');
    pir::load_bytecode('PAST/Pattern/Transformer.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
