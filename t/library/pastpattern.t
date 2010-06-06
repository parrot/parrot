#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Pattern.pbc');

plan(2036);

test_type_matching();
test_attribute_exact_matching();
test_child_exact_matching();
test_attribute_smart_matching();
test_child_smart_matching();

test_deep_matching_in_children();

test_match_result();

sub node_with_attr_set ($class, $attr, $val) {
    my $node := $class.new();
    if (($attr eq "source" || $attr eq "pos")
        && pir::isa__IPP($class, PAST::Node)) {
        $node{$attr} := $val;
    }
    else {
        $node.attr($attr, $val, 1);
    }
    $node;
}

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
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::Block.");
        }

        if $_ ~~ PAST::Op {
            ok($_ ~~ $opPat, "PAST::Op ~~ PAST::Pattern::Op.");
        }
        else {
            ok(!($_ ~~ $opPat),
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::Op.");
        }

        if $_ ~~ PAST::Stmts {
            ok($_ ~~ $stmtsPat, "PAST::Stmts ~~ PAST::Pattern::Stmts.");
        } 
        else {
            ok(!($_ ~~ $stmtsPat),
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::Stmts.");
        }

        if $_ ~~ PAST::Val {
            ok($_ ~~ $valPat, "PAST::Val ~~ PAST::Pattern::Val.");
        }
        else {
            ok(!($_ ~~ $valPat),
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::Val.");
        }

        if $_ ~~ PAST::Var {
            ok($_ ~~ $varPat, "PAST::Var ~~ PAST::Pattern::Var.");
        }
        else {
            ok(!($_ ~~ $varPat),
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::Var.");
        }

        if $_ ~~ PAST::VarList {
            ok($_ ~~ $varListPat,
               "PAST::VarList ~~ PAST::Pattern::VarList.");
        }
        else {
            ok(!($_ ~~ $varListPat),
               ~pir::class__PP($_) ~ " !~~ PAST::Pattern::VarList.");
	}
    }
}

sub test_attribute_exact_matching () {
    test_attribute_exact_matching_node_attributes();
    test_attribute_exact_matching_block_attributes();
    test_attribute_exact_matching_op_attributes();
    test_attribute_exact_matching_val_attributes();
    test_attribute_exact_matching_var_attributes();
}

sub test_attribute_exact_matching_node_attributes () {
    test_attribute_exact_matching_on_node_attr("name");
    test_attribute_exact_matching_on_node_attr("source");
    test_attribute_exact_matching_on_node_attr("pos");
    test_attribute_exact_matching_on_node_attr("returns");
    test_attribute_exact_matching_on_node_attr("arity");
    test_attribute_exact_matching_on_node_attr("named");
    test_attribute_exact_matching_on_node_attr("flat");
    test_attribute_exact_matching_on_node_attr("lvalue");
}

sub test_attribute_exact_matching_on_node_attr($attr) {
    my @classes :=
      $attr eq "lvalue" ??
        [ [PAST::Pattern::Block, PAST::Block],
          [PAST::Pattern::Op, PAST::Op],
          [PAST::Pattern::Stmts, PAST::Stmts],
          [PAST::Pattern::Var, PAST::Var],
          [PAST::Pattern::VarList, PAST::VarList] ]
        !!
          [ [PAST::Pattern::Block, PAST::Block],
            [PAST::Pattern::Op, PAST::Op],
            [PAST::Pattern::Stmts, PAST::Stmts],
            [PAST::Pattern::Val, PAST::Val],
            [PAST::Pattern::Var, PAST::Var],
            [PAST::Pattern::VarList, PAST::VarList] ];

    for @classes {
        my $class := $_[1];
        my $patClass := $_[0];
        my $pattern := node_with_attr_set($patClass, $attr, "foo");

        my $right := node_with_attr_set($class, $attr, "foo");
        ok($right ~~ $pattern, "Matching $class.$attr.");

        my @wrong := [ node_with_attr_set($class, $attr, "bar"),
                       node_with_attr_set($class,
                                          ($attr eq "name" ??
                                           "returns" !! "name"),
                                          "foo"),
                       $class.new("foo"),
                       $class.new()
                     ];

        for @classes {
            my $otherClass := $_[1];
            unless (pir::issame__IPP($class, $otherClass)) {
                pir::push(@wrong, node_with_attr_set($otherClass,
                                                         $attr,
                                                         "foo"));
            }
        }

        my $iota := 0;
        for @wrong {
            ok(!($_ ~~ $pattern),
               "Non-matching $class.$attr " ~ ($iota++) );
        }
    }
}

sub test_attribute_exact_matching_on_subtype_attr ($class,
                                                   $pattClass,
                                                   $attr) {
    my $pattern := node_with_attr_set($pattClass, $attr, "foo");
    my $rightBegin := "Matching $pattClass.$attr:";
    my $wrongBegin := "Non-matching $pattClass.$attr:";

    my @right := [ node_with_attr_set($class, $attr, "foo") ];
    my @rightMessages := 
      [ "$rightBegin simple case." ];
    my $node := node_with_attr_set($class, $attr, "foo");
    $node.name("bar");
    pir::push(@right, $node);
    pir::push(@rightMessages,
              "$rightBegin with different :name.");

    $node := $class.new(:name("bar"));
    $node.attr($attr, "foo", 1);
    pir::push(@right, $node);
    pir::push(@rightMessages,
              "$rightBegin with different name first.");

    $node := node_with_attr_set($class, $attr, "foo");
    $node.name("foo");
    pir::push(@right, $node);
    pir::push(@rightMessages,
              "$rightBegin with same name.");
    
    $node := $class.new(:name("foo"));
    $node.attr($attr, "foo", 1);
    pir::push(@right, $node);
    pir::push(@rightMessages,
              "$rightBegin with same name first.");

    for @right {
        ok($_ ~~ $pattern, pir::shift__SP(@rightMessages));
    }

    my @wrong := [ $class.new(),
                   $class.new("foo"),
                   node_with_attr_set($class, $attr, "bar")
                 ];
    my @wrongMessages := [ "$wrongBegin plain $class.",
                           "$wrongBegin with child.",
                           "$wrongBegin with wrong value."
                         ];

    for @wrong {
        ok(!($_ ~~ $pattern),
           pir::shift__PP(@wrongMessages));
    }
}


sub test_attribute_exact_matching_block_attributes () {
    test_attribute_exact_matching_on_block_attr("blocktype");
    test_attribute_exact_matching_on_block_attr("closure");
    test_attribute_exact_matching_on_block_attr("control");
    test_attribute_exact_matching_on_block_attr("loadinit");
    test_attribute_exact_matching_on_block_attr("namespace");
    test_attribute_exact_matching_on_block_attr("multi");
    test_attribute_exact_matching_on_block_attr("hll");
    test_attribute_exact_matching_on_block_attr("nsentry");
    test_attribute_exact_matching_on_block_attr("lexical");
    test_attribute_exact_matching_on_block_attr("compiler");
    test_attribute_exact_matching_on_block_attr("compiler_args");
    test_attribute_exact_matching_on_block_attr("subid");
    test_attribute_exact_matching_on_block_attr("pirflags");
}

sub test_attribute_exact_matching_on_block_attr ($attr) {
    test_attribute_exact_matching_on_subtype_attr(PAST::Block,
                                                  PAST::Pattern::Block,
                                                  $attr);
}

sub test_attribute_exact_matching_op_attributes () {
    test_attribute_exact_matching_on_op_attr("pasttype");
    test_attribute_exact_matching_on_op_attr("pirop");
    test_attribute_exact_matching_on_op_attr("inline");
}

sub test_attribute_exact_matching_on_op_attr ($attr) {
    test_attribute_exact_matching_on_subtype_attr(PAST::Op,
                                                  PAST::Pattern::Op,
                                                  $attr);
}

sub test_attribute_exact_matching_val_attributes () {
    test_attribute_exact_matching_on_subtype_attr(PAST::Val,
                                                  PAST::Pattern::Val,
                                                  "value");
}

sub test_attribute_exact_matching_var_attributes () {
    test_attribute_exact_matching_on_var_attr("scope");
    test_attribute_exact_matching_on_var_attr("isdecl");
    test_attribute_exact_matching_on_var_attr("namespace");
    test_attribute_exact_matching_on_var_attr("slurpy");
    test_attribute_exact_matching_on_var_attr("call_sig");
    test_attribute_exact_matching_on_var_attr("viviself");
    test_attribute_exact_matching_on_var_attr("vivibase");
    test_attribute_exact_matching_on_var_attr("multitype");
}

sub test_attribute_exact_matching_on_var_attr ($attr) {
    test_attribute_exact_matching_on_subtype_attr(PAST::Var,
                                                  PAST::Pattern::Var,
                                                  $attr);
}

sub test_child_exact_matching () {
    my @classes := [ [ PAST::Block, PAST::Pattern::Block ],
                     [ PAST::Op, PAST::Pattern::Op ],
                     [ PAST::Stmts, PAST::Pattern::Stmts ],
                     [ PAST::Val, PAST::Pattern::Val ],
                     [ PAST::Var, PAST::Pattern::Var ],
                     [ PAST::VarList, PAST::Pattern::VarList]
                   ];

    for @classes {
        my $nodeClass := $_[0];
        my $patternClass := $_[1];
        

        sub right ($node, $pattern, $msg) {
            ok($node ~~ $pattern, "Matching $patternClass: $msg.");
        }

        sub wrong ($node, $pattern, $msg) {
            ok(!($node ~~ $pattern),
               "Matching $patternClass: $msg.");
        }

        my $pattern := $patternClass.new(1);

        right($nodeClass.new(1), $pattern, "(1) ~~ (1)");
        wrong($nodeClass.new(), $pattern, "() !~~ (1)");
        wrong($nodeClass.new(0), $pattern, "(0) !~~ (1)");
        wrong($nodeClass.new(1, 2), $pattern, "(1, 2) !~~ (1)");
        wrong($nodeClass.new(2, 1), $pattern, "(2, 1) !~~ (1)");

        $pattern := $patternClass.new(1, 2);

        right($nodeClass.new(1, 2), $pattern, "(1, 2) == (1, 2)");
        wrong($nodeClass.new(), $pattern, "() !~~ (1, 2)");
        wrong($nodeClass.new(1), $pattern, "(1) !~~ (1, 2)");
        wrong($nodeClass.new(0, 2), $pattern, "(0, 2) !~~ (1, 2)");
        wrong($nodeClass.new(1, 3), $pattern, "(1, 3) !~~ (1, 2)");
        wrong($nodeClass.new(1, 2, 3), $pattern, "(1, 2, 3) !~~ (1, 2)");        
    }
}

sub test_attribute_smart_matching () {
    my $nodeattrs := "name source pos returns arity named flat ";
    my @classes := 
      [ [ PAST::Block, PAST::Pattern::Block,
          pir::split(" ", $nodeattrs ~
                     "lvalue blocktype closure control loadinit " ~
                     "namespace multi hll nsentry symtable " ~
                     "lexical compiler compiler_args subid pirflags")
        ],
        [ PAST::Op, PAST::Pattern::Op,
          pir::split(" ", $nodeattrs ~ "lvalue pirop pasttype inline")
        ],
        [ PAST::Stmts, PAST::Pattern::Stmts,
          pir::split(" ", $nodeattrs ~ "lvalue")
        ],
        [ PAST::Val, PAST::Pattern::Val,
          pir::split(" ", $nodeattrs ~ "value")
        ],
        [ PAST::Var, PAST::Pattern::Var,
          pir::split(" ", $nodeattrs ~ "lvalue scope isdecl " ~
                     "namespace slurpy call_sig viviself vivibase " ~
                     "multitype")
        ],
        [ PAST::VarList, PAST::Pattern::VarList,
          pir::split(" ", $nodeattrs ~ "lvalue")
        ]
      ];

    for @classes {
        my $class := $_[0];
        my $patternClass := $_[1];
        my @attrs := $_[2];

        sub right ($node, $pattern, $msg) {
            ok($node ~~ $pattern,
               "Smart-matching attrs of $patternClass: $msg.");
        }
        sub wrong ($node, $pattern, $msg) {
            ok(!($node ~~ $pattern),
               "Non-smart-matching attrs of $patternClass: $msg.");
        }

        for @attrs {
            my $attr := $_;

            my $pattern := 
              node_with_attr_set($patternClass, 
                                 $attr,
                                 PAST::Pattern::Val.new());

            right(node_with_attr_set($class,
                                     $attr,
                                     PAST::Val.new()),
                  $pattern,
                  "PAST::Pattern $attr");
            wrong($class.new(), $pattern,
                  "PAST::Pattern $attr, no corresponding attr");
            wrong(node_with_attr_set($class,
                                     $attr,
                                     PAST::Block.new()),
                  $pattern,
                  "PAST::Pattern $attr, wrong node type");
            wrong(node_with_attr_set($class,
                                     $attr eq "name"
                                     ?? "pos"
                                     !! "name",
                                     PAST::Val.new()),
                  $pattern,
                  "PAST::Pattern $attr, wrong attribute");
            wrong($class.new(PAST::Val.new()),
                  $pattern,
                  "PAST::Pattern $attr, in child instead");

            $pattern := node_with_attr_set($patternClass,
                                           $attr,
                                           /foo/);

            right(node_with_attr_set($class, $attr, "foo"),
                  $pattern,
                  "Regex $attr");
            wrong($class.new(), $pattern,
                  "Regex $attr, no corresponding attr");
            wrong(node_with_attr_set($class, $attr, "fop"),
                  $pattern,
                  "Regex $attr, wrong string");
            wrong(node_with_attr_set($class,
                                     $attr eq "name"
                                     ?? "pos"
                                     !! "name",
                                     "foo"),
                  $pattern,
                  "Regex $attr, wrong attribute");
            wrong($class.new("foo"),
                  $pattern,
                  "Regex $attr, in child instead");
        
            $pattern := node_with_attr_set($patternClass,
                                           $attr,
                                           sub ($_) { +$_ % 2; });

            right(node_with_attr_set($class, $attr, 1),
                  $pattern,
                  "Closure $attr");
            wrong($class.new(), $pattern,
                  "Closure $attr, no corresponding attr");
            wrong(node_with_attr_set($class, $attr, 2),
                  $pattern,
                  "Closure $attr, wrong result");
            wrong(node_with_attr_set($class,
                                     $attr eq "name"
                                     ?? "pos"
                                     !! "name",
                                     "foo"),
                  $pattern,
                  "Closure $attr, wrong attribute");
            wrong($class.new(1),
                  $pattern,
                  "Closure $attr, in child instead");

        }
    }
}

sub test_child_smart_matching () {
    my @classes := [ [ PAST::Block, PAST::Pattern::Block ],
                     [ PAST::Op, PAST::Pattern::Op ],
                     [ PAST::Stmts, PAST::Pattern::Stmts ],
                     [ PAST::Val, PAST::Pattern::Val ],
                     [ PAST::Var, PAST::Pattern::Var ],
                     [ PAST::VarList, PAST::Pattern::VarList ]
                   ];

    for @classes {
        my $class := $_[0];
        my $patternClass := $_[1];

        sub right ($node, $pattern, $msg) {
            ok($node ~~ $pattern,
               "Smart-matching children of $patternClass: $msg.");
        }
        sub wrong ($node, $pattern, $msg) {
            ok(!($node ~~ $pattern),
               "Non-smart-matching children of $patternClass: $msg.");
        }

        my $pattern := $patternClass.new(PAST::Pattern::Val.new());

        right($class.new(PAST::Val.new()), $pattern,
              "Single PAST::Pattern child");
        wrong($class.new(), $pattern,
              "Single PAST::Pattern, no corresponding child");
        wrong($class.new(PAST::Block.new()), $pattern,
              "Single PAST::Pattern, wrong node type");
        wrong($class.new(PAST::Val.new(), PAST::Val.new()), $pattern,
              "Single PAST::Pattern, extra child of right type");
        wrong($class.new(PAST::Val.new(), PAST::Block.new()), $pattern,
              "Single PAST::Pattern, extra child of wrong type");
        wrong($class.new(PAST::Block.new(), PAST::Val.new()), $pattern,
              "Single PAST::Pattern, extra child of wrong type first");

        $pattern := $patternClass.new(/foo/);

        right($class.new("foo"), $pattern,
              "Single regex");
        wrong($class.new(), $pattern,
              "Single regex, no corresponding child");
        wrong($class.new("fop"), $pattern,
              "Single regex, wrong string");
        wrong($class.new("foo", "foo"), $pattern,
              "Single regex, extra child of right string");
        wrong($class.new("foo", "bar"), $pattern,
              "Single regex, extra child of wrong string");
        wrong($class.new("bar", "foo"), $pattern,
              "Single regex, extra child of wrong string first.");
        
        $pattern := $patternClass.new(sub ($_) { +$_ % 2; });

        right($class.new(3), $pattern,
              "Single closure child");
        wrong($class.new(), $pattern,
              "Single closure, no corresponding child");
        wrong($class.new(2), $pattern,
              "Single closure, false result");
        wrong($class.new(3, 5), $pattern,
              "Single closure, extra child of right result");
        wrong($class.new(3, 6), $pattern,
              "Single closure, extra child of wrong result");
        wrong($class.new(6, 3), $pattern,
              "Single closure, extra child of wrong result first");
    }
}

sub test_deep_matching_in_children () {
    my @classes := [ PAST::Block, PAST::Op, PAST::Stmts,
                     PAST::Val, PAST::Var, PAST::VarList ];

    my $pattern := PAST::Pattern::Val.new(:returns('Integer'));
    my $node, my $class;
    my $childNode := PAST::Val.new(:returns('Integer'));

    for @classes {
        $class := $_;

        $node := $class.new($childNode);
        ok($node ~~ $pattern, 
           "Deep matching $class: Matching subtree as first child.");

        $node := $class.new(PAST::Block.new(),
                            $childNode);
        ok($node ~~ $pattern,
           "Deep matching $class: Matching subtree as second child.");

        $node := $class.new();
        ok(!($node ~~ $pattern),
           "Deep matching $class: no children.");

        $node := $class.new(PAST::Var.new());
        ok(!($node ~~ $pattern),
           "Deep matching $class: wrong type of child.");
    }

}

sub test_match_result () {
    test_match_result_from_top_node();
    test_match_result_from_sub_node();
    test_match_result_from_closure();
    test_match_result_from_constant();
}

sub test_match_result_from_top_node () {
    my @classes := [ [ PAST::Block, PAST::Pattern::Block ],
                     [ PAST::Op, PAST::Pattern::Op ],
                     [ PAST::Stmts, PAST::Pattern::Stmts ],
                     [ PAST::Val, PAST::Pattern::Val ],
                     [ PAST::Var, PAST::Pattern::Var ],
                     [ PAST::VarList, PAST::Pattern::VarList ]
                   ];

    for @classes {
        my $class := $_[0];
        my $patternClass := $_[1];

        my $begin := "Match result from $patternClass:";

        my $pattern := $patternClass.new();
        my $node := $class.new();
        my $/ := $node ~~ $pattern;
        ok($/ ~~ PAST::Pattern::Match,
           "$begin 1, returns a PAST::Pattern::Match");
        ok(?$/, "$begin 1, Bool conversion");
        ok($/.from() =:= $node,
           "$begin 1, .from");

        $node := ($class =:= PAST::Block
                  ?? PAST::Op !! PAST::Block).new();
        $/ := $node ~~ $pattern;
        ok($/ ~~ PAST::Pattern::Match,
           "$begin 0, returns PAST::Pattern::Match");
        ok(!?$/, "$begin 0, Bool conversion.");
    }
}

sub test_match_result_from_sub_node () {
    my $pattern := PAST::Pattern::Val.new(:returns('Integer'));
    my $node := PAST::Op.new(:pirop<abs>, 
                             PAST::Val.new(:value(5),
                                           :returns<Integer>));
    my $/ := $node ~~ $pattern;

    ok($/ ~~ PAST::Pattern::Match,
       "Deep match result on Node 1 is a PAST::Pattern::Match.");
    ok(?$/,
       "Deep match result on Node 1 converts to boolean truth.");
    ok($/.from() =:= $node[0],
       "Deep match result on Node 1 has correct .from.");
}

sub test_match_result_from_closure () {
    my $pattern := 
      PAST::Pattern::Closure.new(sub ($_) { 
                                     $_ ~~ PAST::Val
                                       && $_.returns() eq 'Integer';
                                 });
    my $node := PAST::Val.new(:returns('Integer'));
    my $/ := $node ~~ $pattern;
    
    ok($/ ~~ PAST::Pattern::Match, 
       "Match result from Closure 1 is a PAST::Pattern::Match.");
    ok(?$/,
       "Match result from Closure 1 converts to boolean truth.");
    ok($/.from =:= $node,
       "Match result from Closure 1 has correct .from.");

    $node := PAST::Val.new(:returns('String'));
    $/ := $node ~~ $pattern;
    ok($/ ~~ PAST::Pattern::Match,
       "Match result from Closure 0 is a PAST::Pattern::Match.");
    ok(!?$/,
       "Match result from Closure 0 converts to boolean falsehood.");
}

sub test_match_result_from_constant () {
    my $pattern := PAST::Pattern::Constant.new(5);
    my $node := 5;
    my $/ := $node ~~ $pattern;
    
    ok($/ ~~ PAST::Pattern::Match, 
       "Match result from Constant 1 is a PAST::Pattern::Match.");
    ok(?$/,
       "Match result from Constant 1 converts to boolean truth.");

    $node := 6;
    $/ := $node ~~ $pattern;
    ok($/ ~~ PAST::Pattern::Match,
       "Match result from Constant 0 is a PAST::Pattern::Match.");
    ok(!?$/,
       "Match result from Constant 0 converts to boolean falsehood.");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
