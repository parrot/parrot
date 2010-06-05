#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode("PCT.pbc");
}

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
}

INIT {
    pir::load_bytecode('PAST/Pattern/Closure.pbc');
    pir::load_bytecode('PAST/Pattern/Constant.pbc');
    pir::load_bytecode('PAST/Pattern/Node.pbc');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
