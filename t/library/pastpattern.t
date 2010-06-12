#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Pattern.pbc');

plan(2092);

test_type_matching();
test_attribute_exact_matching();
test_child_exact_matching();
test_attribute_smart_matching();
test_child_smart_matching();

test_deep_matching_in_children();
test_global_matching();

test_match_result();

test_transform();

test_match_method();

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

        my $pattern := $patternClass.new();
        my $node := $class.new();
        ok($node ~~ $pattern,
           "Empty $class ~~ empty $patternClass.");

        $node := $class.new(5);
        ok($node ~~ $pattern,
           "Non-empty $class ~~ empty $patternClass.");

        $node := $class.new(:name('foo'));
        ok($node ~~ $pattern,
           "Attributed $class ~~ empty $patternClass.");
        
        for @classes {
            my $otherClass := $_[0];
            unless ($class =:= $otherClass) {
                $node := $otherClass.new();
                ok(!($node ~~ $pattern),
                   "Empty $otherClass !~~ empty $patternClass.");
            }
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
    my @classes := [ [ PAST::Block, PAST::Pattern::Block],
                     [ PAST::Op, PAST::Pattern::Op],
                     [ PAST::Stmts, PAST::Pattern::Stmts],
                     [ PAST::Val, PAST::Pattern::Val],
                     [ PAST::Var, PAST::Pattern::Var],
                     [ PAST::VarList, PAST::Pattern::VarList ] ];

    my $pattern := PAST::Pattern::Val.new(:returns('Integer'));
    my $node, my $class, my $patternClass;
    my $childNode := PAST::Val.new(:returns('Integer'));

    for @classes {
        $class := $_[0];

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

    for @classes {
        $class := $_[0];
        $patternClass := $_[1];

        if $class =:= PAST::Var {
            $pattern := $patternClass.new(PAST::Pattern::Val.new());
            $node := $class.new(PAST::Op.new(PAST::Val.new()));
        }
        else {
            $pattern := $patternClass.new(PAST::Pattern::Val.new());
            $node := $class.new(PAST::Var.new(PAST::Val.new()));
        }
        ok(!($node ~~ $pattern),
           "Child subpatterns must match exactly.");

        $pattern := $patternClass.new(:name(PAST::Pattern::Val.new()));
        $node := $class.new(:name(PAST::Var.new(PAST::Val.new())));
        ok(!($node ~~ $pattern),
           "Attribute subpatterns must match exactly.");
    }

}

sub test_global_matching () {
    my $pattern := PAST::Pattern::Block.new();
    my $past := PAST::Block.new(PAST::Val.new(PAST::Block.new()),
                                PAST::Block.new(),
                                PAST::Op.new(PAST::Val.new(),
                                             PAST::Block.new()));
    my $/ := $pattern.ACCEPTS($past, :g(1));

    ok($/ ~~ PAST::Pattern::Match,
       '$/ is a PAST::Pattern::Match for global matches.');
    ok(pir::elements__iP($/) == 4,
       '$/ has the right number of elements for global matches.');
    ok($/[0].from() =:= $past,
       'Global matching can match the top node.');
    ok($/[1].from() =:= $past[0][0],
       '$/[1] is correct for global matches.');
    ok($/[2].from() =:= $past[1],
       '$/[2] is correct for global matches.');
    ok($/[3].from() =:= $past[2][1],
       '$/[3] is correct for global matches.');
}

sub test_match_result () {
    test_match_result_from_top_node();
    test_match_result_from_sub_node();
    test_match_result_from_closure();
    test_match_result_from_constant();
    test_match_result_from_node_children();
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
    ok($/.from() == 5,
       "Match result from Constant 1 has correct .from.");

    $node := 6;
    $/ := $node ~~ $pattern;
    ok($/ ~~ PAST::Pattern::Match,
       "Match result from Constant 0 is a PAST::Pattern::Match.");
    ok(!?$/,
       "Match result from Constant 0 converts to boolean falsehood.");
}

sub test_match_result_from_node_children () {
    my $pattern := PAST::Pattern::Block.new(PAST::Pattern::Op.new(),
                                            :blocktype("lexical"));
    my $past := PAST::Block.new(PAST::Op.new(),
                                :blocktype("lexical"));
    my $/ := $past ~~ $pattern;

    ok($/<blocktype>.from() eq "lexical",
       '$/<blocktype> is correct for PAST::Pattern::Blocks.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::Blocks.');

    $pattern := 
      PAST::Pattern::Op.new(PAST::Pattern::Val.new(:returns<Integer>),
                            PAST::Pattern::Val.new(:returns<Integer>),
                            :pirop<add>);
    $past := PAST::Op.new(PAST::Val.new(:returns<Integer>),
                          PAST::Val.new(:returns<Integer>),
                         :pirop<add>);
    $/ := $past ~~ $pattern;

    ok($/<pirop>.from() eq "add",
       '$/<pirop> is correct for PAST::Pattern::Ops.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::Ops.');
    ok($/[1].from() =:= $past[1],
       '$/[1] is correct for PAST::Pattern::Ops.');

    $pattern := PAST::Pattern::Stmts.new(:name<foo>,
                                         PAST::Pattern::Op.new());
    $past := PAST::Stmts.new(:name<foo>,
                             PAST::Op.new());
    $/ := $past ~~ $pattern;

    ok($/<name>.from() eq "foo",
       '$/<name> is correct for PAST::Pattern::Stmts.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::Stmts.');

    $pattern :=
      PAST::Pattern::Val.new(:value(PAST::Pattern::Block.new()),
                             PAST::Pattern::Block.new());
    $past := PAST::Val.new(:value(PAST::Block.new()),
                           PAST::Block.new());
    $/ := $past ~~ $pattern;

    ok($/<value>.from() =:= $past.value(),
       '$/<value> is correct for PAST::Pattern::Vals.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::Vals.');

    $pattern :=
      PAST::Pattern::Var.new(:name<foo>,
                             :scope<package>,
                             PAST::Pattern::Val.new());
    $past := PAST::Var.new(:name<foo>, :scope<package>,
                           PAST::Val.new());
    $/ := $past ~~ $pattern;

    ok($/<name>.from() eq "foo",
       '$/<name> is correct for PAST::Pattern::Vars.');
    ok($/<scope>.from() eq "package",
       '$/<scope> is correct for PAST::Pattern::Vars.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::Vars.');

    $pattern := PAST::Pattern::VarList.new(:name<params>,
                                           PAST::Pattern::Var.new());
    $past := PAST::VarList.new(:name<params>,
                               PAST::Var.new());
    $/ := $past ~~ $pattern;

    ok($/<name>.from() eq "params",
       '$/<name> is correct for PAST::Pattern::VarList.');
    ok($/[0].from() =:= $past[0],
       '$/[0] is correct for PAST::Pattern::VarList.');
}

sub test_transform () {
    test_transform_sub();
}

sub test_transform_sub () {
    sub isComparison ($opName) {
        ($opName eq 'isgt' ||
         $opName eq 'islt');
    }
    sub flipComparison ($/) {
        my $op := $/.from();
        my $temp := $op[0];
        $op[0] := $op[1];
        $op[1] := $temp;
        $op;
    }

    my $pattern := PAST::Pattern::Op.new(:pirop(isComparison));
    my $past := 
      PAST::Stmts.new(PAST::Op.new(:pirop<isgt>,
                                   PAST::Val.new(:value(2)),
                                   PAST::Val.new(:value(1))),
                      PAST::Op.new(:pirop<islt>,
                                   PAST::Op.new(:pirop<islt>,
                                                PAST::Val.new(:value(1)),
                                                PAST::Val.new(:value(2))),
                                   PAST::Val.new(:value(1))));
    my $result := $pattern.transform($past, flipComparison);

    ok($result ~~ PAST::Stmts,
       'Non-matched nodes left unchanged.');
    ok($result[0][0].value() == 1,
       'Matched node 1 is changed.');
    ok($result[1][0] ~~ PAST::Val,
       'Matched node 2 is changed. 1');
    ok($result[1][0].value() == 1,
       'Matched node 2 is changed. 2');
    ok($result[1][1][0].value() == 2,
       'Matched nodes within other matched nodes are changed.');
}

sub test_match_method () {
    my $pattern := PAST::Pattern::Block.new();
    my $past := PAST::Block.new();

    my $/ := $past.match($pattern);
    ok($/ ~~ PAST::Pattern::Match,
       'PAST::Node.match returns a PAST::Pattern::Match.');
    ok(?$/,
       'PAST::Node.match returns a true match result when it should.');
    ok($/.from() =:= $past,
       "PAST::Node.match's return value has the right .from().");

    $past := PAST::Block.new(PAST::Block.new(),
                             PAST::Block.new(PAST::Block.new()));
    my $match1 := $past.match($pattern, :g(1));
    my $match2 := $pattern.ACCEPTS($past, :g(1));

    ok($match1 ~~ PAST::Pattern::Match,
       'PAST::Node.match returns a PAST::Pattern::Match with :g');
    ok(?$match1 == ?$match2,
       'PAST::Node.match with :g has same bool value as ~~.');
    ok(pir::elements__iP($match1) == pir::elements__iP($match2),
       'PAST::Node.match with :g has same number of results as ~~.');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
