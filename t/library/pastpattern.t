#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Pattern.pbc');

plan(36);

test_type_matching();

sub test_type_matching() {
    my $blockPat := PAST::Pattern::Block.new();
    my $opPat := PAST::Pattern::Op.new();
    my $stmtsPat := PAST::Pattern::Stmts.new();
    my $valPat := PAST::Pattern::Val.new();
    my $varPat := PAST::Pattern::Var.new();
    my $varListPat := PAST::Pattern::VarList.new();

    my $block := PAST::Block.new();
    my $op := PAST::Op.new();
    my $stmts := PAST::Stmts.new();
    my $val := PAST::Val.new();
    my $var := PAST::Var.new();
    my $varList := PAST::VarList.new();

    my @objs := [ $block, $op, $stmts, $val, $var, $varList ];

    for @objs {
        if $_ ~~ PAST::Block {
            ok($_ ~~ $blockPat, "PAST::Block ~~ PAST::Pattern::Block.");
        }
        else {
            ok(!($_ ~~ $blockPat), 
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::Block.");
        }

        if $_ ~~ PAST::Op {
            ok($_ ~~ $opPat, "PAST::Op ~~ PAST::Pattern::Op.");
        }
        else {
            ok(!($_ ~~ $opPat),
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::Op.");
        }

        if $_ ~~ PAST::Stmts {
            ok($_ ~~ $stmtsPat, "PAST::Stmts ~~ PAST::Pattern::Stmts.");
        } 
        else {
            ok(!($_ ~~ $stmtsPat),
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::Stmts.");
        }

        if $_ ~~ PAST::Val {
            ok($_ ~~ $valPat, "PAST::Val ~~ PAST::Pattern::Val.");
        }
        else {
            ok(!($_ ~~ $valPat),
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::Val.");
        }

        if $_ ~~ PAST::Var {
            ok($_ ~~ $varPat, "PAST::Var ~~ PAST::Pattern::Var.");
        }
        else {
            ok(!($_ ~~ $varPat),
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::Var.");
        }

        if $_ ~~ PAST::VarList {
            ok($_ ~~ $varListPat,
               "PAST::VarList ~~ PAST::Pattern::VarList.");
        }
        else {
            ok(!($_ ~~ $varListPat),
               ~pir::class__p_p($_) ~ " !~~ PAST::Pattern::VarList.");
	}
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
