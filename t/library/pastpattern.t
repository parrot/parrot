#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Pattern.pbc');

plan(94);

test_type_matching();
test_attribute_exact_matching();

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

sub test_attribute_exact_matching () {
    test_attribute_exact_matching_on_node_attrs();
}

sub test_attribute_exact_matching_on_node_attrs() {
    my $pattern := PAST::Pattern::Block.new(:name("foo"));

    my $right := PAST::Block.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::Block.name.");

    my @wrong := (PAST::Block.new(:name("bar")),
                  PAST::Block.new(:blocktype("foo")),
                  PAST::Block.new("foo"),
                  PAST::Block.new(),
                  PAST::Op.new(:name("foo")),
                  PAST::Stmts.new(:name("foo")),
                  PAST::Val.new(:name("foo")),
                  PAST::Var.new(:name("foo")),
                  PAST::VarList.new(:name("foo")));                           
    my $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::Block.name " ~ ($iota++) );
    }

    $pattern := PAST::Pattern::Op.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::Op.name.");

    @wrong := (PAST::Op.new(:name("bar")),
               PAST::Op.new(:pasttype("foo")),
               PAST::Op.new("foo"),
               PAST::Op.new(),
               PAST::Block.new(:name("foo")),
               PAST::Stmts.new(:name("foo")),
               PAST::Val.new(:name("foo")),
               PAST::Var.new(:name("foo")),
               PAST::VarList.new(:name("foo")));                           
    $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::Op.name " ~ ($iota++) );
    }

    $pattern := PAST::Pattern::Stmts.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::Stmts.name.");

    @wrong := (PAST::Stmts.new(:name("bar")),
               PAST::Stmts.new("foo"),
               PAST::Stmts.new(),
               PAST::Block.new(:name("foo")),
               PAST::Op.new(:name("foo")),
               PAST::Val.new(:name("foo")),
               PAST::Var.new(:name("foo")),
               PAST::VarList.new(:name("foo")));                           
    $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::Stmts.name " ~ ($iota++) );
    }

    $pattern := PAST::Pattern::Val.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::Val.name.");

    @wrong := (PAST::Val.new(:name("bar")),
               PAST::Val.new(:value("foo")),
               PAST::Val.new("foo"),
               PAST::Val.new(),
               PAST::Block.new(:name("foo")),
               PAST::Op.new(:name("foo")),
               PAST::Stmts.new(:name("foo")),
               PAST::Var.new(:name("foo")),
               PAST::VarList.new(:name("foo")));                           
    $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::Val.name " ~ ($iota++) );
    }

    $pattern := PAST::Pattern::Var.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::Var.name.");

    @wrong := (PAST::Var.new(:name("bar")),
               PAST::Var.new(:scope("foo")),
               PAST::Var.new("foo"),
               PAST::Var.new(),
               PAST::Block.new(:name("foo")),
               PAST::Op.new(:name("foo")),
               PAST::Stmts.new(:name("foo")),
               PAST::Val.new(:name("foo")),
               PAST::VarList.new(:name("foo")));                           
    $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::Var.name " ~ ($iota++) );
    }

    $pattern := PAST::Pattern::VarList.new(:name("foo"));
    ok($right ~~ $pattern, "Matching PAST::Pattern::VarList.name.");

    @wrong := (PAST::VarList.new(:name("bar")),
               PAST::VarList.new("foo"),
               PAST::VarList.new(),
               PAST::Block.new(:name("foo")),
               PAST::Op.new(:name("foo")),
               PAST::Stmts.new(:name("foo")),
               PAST::Val.new(:name("foo")),
               PAST::Var.new(:name("foo")));                           
    $iota := 0;
    for @wrong {
        ok(!($_ ~~ $pattern),
           "Non-matching PAST::Pattern::VarList.name " ~ ($iota++) );
    }

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
