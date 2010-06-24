#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Transformer.pbc');
    pir::load_bytecode('PAST/Walker/Dynamic.pbc');
}

class PAST::Transformer::Dynamic is PAST::Transformer {
    PAST::Transformer::Dynamic.HOW().add_parent(PAST::Transformer::Dynamic,
                                                PAST::Walker::Dynamic);
}

module PAST::Walker {
    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::Block $node) {
        my $result;
        my &fn := $walker.block();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
        }
        $result;
    }

    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::Op $node) {
        my $result;
        my &fn := $walker.op();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
        }
        $result;
    }

    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::Stmts $node) {
        my $result;
        my &fn := $walker.stmts();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
        }
        $result;
    }

    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::Val $node) {
        my $result;
        my &fn := $walker.val();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
        }
        $result;
    }

    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::Var $node) {
        my $result;
        my &fn := $walker.var();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
        }
        $result;
    }

    our multi sub walk (PAST::Transformer::Dynamic $walker,
                        PAST::VarList $node) {
        my $result;
        my &fn := $walker.varlist();
        if (pir::defined__IP(&fn)) {
            $result := &fn($walker, $node);
        }
        else {
            $result := $node;
            replaceChildren($result, walkChildren($walker, $node));
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
