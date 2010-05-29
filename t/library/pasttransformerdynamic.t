#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Transformer/Dynamic.pbc');
pir::load_bytecode('runtime/parrot/include/pastcompare.pbc');

plan(3);
test_change_node_attributes();
test_change_node_types();
test_delete_nodes();

sub incVals ($walker, $node) {
    my $v := $node.'value'();
    $v++;
    $node.'value'($v);
    $node;
}

sub test_change_node_attributes () {
    my $past := 
      PAST::Block.new(PAST::Var.new(PAST::Val.new(:value(37))),
		      PAST::Val.new(:value(24)),
		      PAST::Block.new(PAST::Val.new(:value(5)),
				      PAST::Val.new(:value(12))));
    my $transformer := 
        PAST::Transformer::Dynamic.new();
    $transformer.'val'(incVals);
    my $result := $transformer.'walk'($past);
    my $target := 
      PAST::Block.new(PAST::Var.new(PAST::Val.new(:value(38))),
		      PAST::Val.new(:value(25)),
		      PAST::Block.new(PAST::Val.new(:value(6)),
				      PAST::Val.new(:value(13))));
    ok(pir::iseq__i_p_p($result, $target),
       "Node attributes can be changed by PAST::Transformers.");
}

sub negate ($walker, $node) {
    my $v := $node.'value'();
    my $result;
    if ($v < 0) {
	$result := PAST::Op.new(PAST::Val.new(:value(-$v)),
				:pirop<neg>);
    }
    else {
	$result := $node;
    }
    $result;
}

sub test_change_node_types () {
    my $past :=
        PAST::Block.new(PAST::Val.new(:value(0)),
			PAST::Val.new(:value(-7)),
			PAST::Val.new(:value(5)),
			PAST::Val.new(:value(-32)));
    my $transformer := PAST::Transformer::Dynamic.new();
    $transformer.'val'(negate);
    my $result := $transformer.'walk'($past);

    my $target :=
      PAST::Block.new(PAST::Val.new(:value(0)),
		      PAST::Op.new(PAST::Val.new(:value(7)),
				   :pirop<neg>),
		      PAST::Val.new(:value(5)),
		      PAST::Op.new(PAST::Val.new(:value(32)),
				   :pirop<neg>));
    ok(pir::iseq__i_p_p($result, $target),
       "Node types can be changed by PAST::Transformers.")
}

sub trim ($walker, $node) {
    my $result;
    my $length := pir::elements__i_p($node);
    if ($length <= 1) {
	$result := $node;
	my $children := PAST::Walker::walkChildren($walker, $node);
	PAST::Walker::replaceChildren($result, $children);
    }
    else {
	$result := null;
    }
    $result;
}

sub test_delete_nodes () {
    my $past :=
      PAST::Block.new(PAST::Stmts.new(PAST::Var.new(),
				      PAST::Block.new(PAST::Val.new()),
				      PAST::Block.new(PAST::Op.new(),
						      PAST::VarList.new()),
				      PAST::Block.new(PAST::Val.new(),
						      PAST::Val.new(),
						      PAST::Val.new())));
    my $transformer := PAST::Transformer::Dynamic.new();
    $transformer.'block'(trim);
    my $result := $transformer.'walk'($past);
    my $target :=
      PAST::Block.new(PAST::Stmts.new(PAST::Var.new(),
				      PAST::Block.new(PAST::Val.new())));
    
    ok(pir::iseq__i_p_p($result, $target),
       "Nodes can be deleted by PAST::Transformers.");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
