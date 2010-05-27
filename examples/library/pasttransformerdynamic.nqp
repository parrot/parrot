pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Transformer/Dynamic.pbc');
pir::load_bytecode('Data/Dumper.pbc');

sub foldOp ($walker, $node) {
    if ($node.pirop() eq 'add') && 
        ($node[0] ~~ PAST::Val) && 
	($node[1] ~~ PAST::Val) {
	my $val := $node[0].value() + $node[1].value();
	my $result := PAST::Val.new(:value($val));
	$result;
    }
    else {
        my $children := PAST::Walker::walkChildren($walker, $node);
	PAST::Walker::replaceChildren($node, $children);
	$node;
    }
}

my $comp := Q:PIR { %r = compreg 'NQP-rx' };
my $past := $comp.compile('say(1+2);', :target<past>);

my $dumper := Q:PIR { %r = new ['Data';'Dumper'] };
$dumper.dumper($past);

say("\nChanging:\n");

my $walker := Q:PIR { %r = new ['PAST'; 'Transformer'; 'Dynamic']};
$walker.op(foldOp);

$walker.walk($past);
$dumper.dumper($past);
