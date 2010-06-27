#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT/Pattern.pbc');
}

class POST::Pattern is PCT::Pattern {
    method result ($value?) {
        self.attr("result", $value, pir::defined__iPP($value));
    }

    my @attributes := pir::clone__PP(PCT::Pattern.attributes());
    pir::push(@attributes, 'result');
    method attributes () {
        @attributes;
    }

    method target_class () {
        POST::Node;
    }
}

class POST::Pattern::Op is POST::Pattern {
    method pirop ($value?) {
        self.attr('value', $value, !pir::isnull__IP($value));
    }
    method inline ($value?) {
        self.attr('value', $value, !pir::isnull__IP($value));
    }

    my @attributes := pir::clone__PP(POST::Pattern.attributes());
    pir::push(@attributes, 'pirop');
    pir::push(@attributes, 'inline');
    method attributes () { @attributes; }

    method target_class () { POST::Op; }
}

class POST::Pattern::Ops is POST::Pattern {
    method target_class () { POST::Ops; }
}

class POST::Pattern::Label is POST::Pattern {
    method target_class () { POST::Label; }
}

class POST::Pattern::Sub is POST::Pattern {
    my @attributes := pir::clone__PP(POST::Pattern.attributes());
    for (<blocktype namespace hll outer multi subid pirflags compiler
         compiler_args paramlist directives>) {
        pir::push(@attributes, $_);
    }
    method attributes () { @attributes; }

    method target_class () { POST::Sub; }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
