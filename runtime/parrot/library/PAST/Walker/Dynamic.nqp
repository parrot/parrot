#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PAST/Walker.pbc');
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

class PAST::Walker::Dynamic is PAST::Walker {
    has $block;
    has $op;
    has $stmts;
    has $val;
    has $var;
    has $varlist;

    for (<block op stmts val var varlist>) {
        gen_accessor(PAST::Walker::Dynamic, $_, "\$" ~ $_);
    }
}

module Tree::Walker {
    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::Block $node) {
        my &fn := $walker.block();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }

    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::Op $node) {
        my &fn := $walker.op();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }

    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::Stmts $node) {
        my &fn := $walker.stmts();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }

    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::Val $node) {
        my &fn := $walker.val();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }

    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::Var $node) {
        my &fn := $walker.var();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }

    our multi sub walk (PAST::Walker::Dynamic $walker, PAST::VarList $node) {
        my &fn := $walker.varlist();
        if &fn {
            &fn($walker, $node);
        }
        else {
            walkChildren($walker, $node);
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
