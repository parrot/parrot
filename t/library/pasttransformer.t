#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

INIT {
    pir::load_bytecode('PCT.pbc');
    pir::load_bytecode('PAST/Transformer.pbc');
    pir::load_bytecode('PAST/Pattern.pbc');
}

plan(4);
test_change_node_attributes();
test_change_node_types();
test_delete_nodes();
test_traverse_var_attributes();

class Increment is PAST::Transformer { }
class Negate is PAST::Transformer { }
class Trim is PAST::Transformer { }

module Tree::Walker {
    our multi sub walk (Increment $walker, PAST::Val $val) {
	$val.value($val.value + 1);
	$val;
    }

    our multi sub walk (Negate $walker, PAST::Val $val) {
	if $val.value < 0 {
	    PAST::Op.new(:pirop<neg>, PAST::Val.new(:value(-$val.value)));
	}
	else {
	    $val;
	}
    }

    our multi sub walk (Trim $walker, PAST::Block $block) {
	if pir::elements__IP($block) > 1 {
	    null;
	}
	else {
	    replaceChildren($block, walkChildren($walker, $block));
	    $block;
	}
    }
}

sub test_change_node_attributes () {
    my $past :=
      PAST::Block.new(PAST::Var.new(PAST::Val.new(:value(37))),
		      PAST::Val.new(:value(24)),
		      PAST::Block.new(PAST::Val.new(:value(5)),
				      PAST::Val.new(:value(12))));
    my $transformer := Increment.new;

    my $result := $transformer.walk($past);

    my $target := PAST::Pattern::Block.new;
    $target[0] := PAST::Pattern::Var.new(PAST::Pattern::Val.new(:value(38)));
    $target[1] := PAST::Pattern::Val.new(:value(25));
    $target[2] := PAST::Pattern::Block.new(PAST::Pattern::Val.new(:value(6)),
					   PAST::Pattern::Val.new(:value(13)));

    ok($result.match($target, :pos($result)),
       "Node attributes can be changed by PAST::Transformers");
}

sub test_change_node_types () {
    my $past :=
      PAST::Block.new(PAST::Val.new(:value(0)),
		      PAST::Val.new(:value(-7)),
		      PAST::Val.new(:value(5)),
		      PAST::Val.new(:value(-32)));

    my $transformer := Negate.new;

    my $result := $transformer.walk($past);

    my $target := PAST::Pattern::Block.new;
    $target[0] := PAST::Pattern::Val.new(:value(0));
    $target[1] := PAST::Pattern::Op.new(:pirop<neg>,
					PAST::Pattern::Val.new(:value(7)));
    $target[2] := PAST::Pattern::Val.new(:value(5));
    $target[3] := PAST::Pattern::Op.new(:pirop<neg>,
					PAST::Pattern::Val.new(:value(32)));

    ok($result.match($target, :pos($result)),
       "Node types can be changed by PAST::Transformers.");
}

sub test_delete_nodes () {
    my $past :=
      PAST::Block.new(PAST::Stmts.new(PAST::Var.new,
				      PAST::Block.new(PAST::Val.new),
				      PAST::Block.new(PAST::Op.new,
						      PAST::VarList.new),
				      PAST::Block.new(PAST::Val.new,
						      PAST::Val.new,
						      PAST::Val.new)));

    my $transformer := Trim.new;

    my $result := $transformer.walk($past);

    my $target := PAST::Pattern::Block.new;
    $target[0] := PAST::Pattern::Stmts.new(PAST::Pattern::Var.new);
    $target[0][1] := PAST::Pattern::Block.new(PAST::Pattern::Val.new);
    ok($result.match($target, :pos($result)),
       "Nodes can be deleted by PAST::Transformers.");
}

sub test_traverse_var_attributes () {
    my $past :=
      PAST::Var.new(:viviself(PAST::Val.new(:value(5))),
                    :vivibase(PAST::Val.new(:value(6))));
    my $transformer := Increment.new;
    my $result := $transformer.walk($past);
    my $target :=
      PAST::Pattern::Var.new(:viviself(PAST::Pattern::Val.new(:value(6))),
                             :vivibase(PAST::Pattern::Val.new(:value(7))));
    ok($result.match($target, :pos($result)),
       "PAST::Transformer walks PAST::Var.viviself and .vivibase.");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
