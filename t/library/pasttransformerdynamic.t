#! ./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Transformer/Dynamic.pbc');
pir::load_bytecode('runtime/parrot/include/pastcompare.pbc');

plan(1);
test_change_node_attributes();

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

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
