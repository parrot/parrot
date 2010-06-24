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

    method check_post_node_attributes ($node, $/) {
        self.check_attribute("result", $node, $/);
    }
}

INIT {
    POST::Pattern.new_subtype('POST::Pattern::Op',
                              POST::Op,
                              :attr(<pirop inline>));
    POST::Pattern.new_subtype('POST::Pattern::Ops',
                              POST::Ops);
    POST::Pattern.new_subtype('POST::Pattern::Label',
                              POST::Label);
    POST::Pattern.new_subtype('POST::Pattern::Sub',
                              POST::Sub,
                              :attr(<blocktype namespace hll outer
                                     multi subid pirflags compiler
                                     compiler_args paramlist
                                     directives>));
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
