#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Walker/Dynamic.pbc');

plan(5);
test_count_node_types();

# Tests

# test_count_node_types()
# Uses PAST::Walker::NodeCounter to count the number of each node type
#  in a PAST. It tests that traversal of all node types does work.

my $blocks;
my $ops;
my $stmts;
my $vals;
my $vars;

sub walkBlock ($walker, $past) {
    ++$blocks;
    PAST::Walker::walkChildren($walker, $past);
}
sub walkOp ($walker, $past) {
    ++$ops;
    PAST::Walker::walkChildren($walker, $past);
}
sub walkStmts ($walker, $past) {
    ++$stmts;
    PAST::Walker::walkChildren($walker, $past);
}
sub walkVal ($walker, $past) {
    ++$vals;
    PAST::Walker::walkChildren($walker, $past);
}
sub walkVar ($walker, $past) {
    ++$vars;
    PAST::Walker::walkChildren($walker, $past);
}

sub zeroCounts () {
    $blocks := 0;
    $ops := 0;
    $stmts := 0;
    $vals := 0;
    $vars := 0;
}

sub test_count_node_types() {
    my $walker := PAST::Walker::Dynamic.new();
    
    $walker.block(walkBlock);
    $walker.op(walkOp);
    $walker.stmts(walkStmts);
    $walker.val(walkVal);
    $walker.var(walkVar);

    zeroCounts();

    my $past := build_count_node_types_past();
    
    $walker.walk($past);
    
    ok($blocks == 2, "PAST::Block");
    ok($ops == 3, "PAST::Op");
    ok($vars == 2, "PAST::Var");
    ok($vals == 1, "PAST::Val");
    ok($stmts == 2, "PAST::Stmts");
}

sub build_count_node_types_past() {
    my $past := 
        PAST::Block.new(PAST::Var.new(),
			PAST::Op.new(PAST::Var.new(),
				     PAST::Val.new(),
				     :pirop<call>),
			PAST::Stmts.new(PAST::Op.new(),
					PAST::Op.new(),
					PAST::Block.new()),
			PAST::Stmts.new());
    $past;
}

# Local Variables:
#   mode: cperl-mode
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
