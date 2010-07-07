#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Transformer.pbc');
}

my sub gen_accessor ($class, $meth, $attr) {
    $class.HOW().add_method($class, $meth, 
                             method ($val?) {
                                 my $result;
                                 if (pir::defined__IP($val)) {
                                     pir::setattribute(self, ~$attr, $val);
                                 }
                                 else {
                                     $result := 
                                       pir::getattribute__PPS(self, $attr);
                                 }
                                 $result;
                             });
}

class PAST::Transformer::Dynamic is PAST::Transformer {
    has $block;
    has $op;
    has $stmts;
    has $val;
    has $var;
    has $varlist;

    for (<block op stmts val var varlist>) {
        gen_accessor(PAST::Transformer::Dynamic, $_, "\$" ~ $_);
    }
}

module Tree::Walker {
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
