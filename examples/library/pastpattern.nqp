#!./parrot-nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

pir::load_bytecode('PCT.pbc');
pir::load_bytecode('PAST/Pattern.pbc');
pir::load_bytecode('Data/Dumper.pbc');

sub isFoldable ($opName) {
    $opName eq "add";
}

sub isInteger ($val) {
    pir::isa__iPP($val, Integer);
}

sub fold ($/) {
    my $value := $/[0].value() + $/[1].value();
    my $node := PAST::Val.new(:value($value),
                              :returns('Integer'));
    $node;
}

my $binaryPattern := 
  PAST::Pattern::Op.new(:pirop(isFoldable),
                        PAST::Pattern::Val.new(:value(isInteger)),
                        PAST::Pattern::Val.new(:value(isInteger)));

my $dumper := pir::new__Pp(Data::Dumper);
my $compiler := pir::compreg__PS("NQP-rx");
my $past := $compiler.compile("say(1+2);", :target<past>);

say("Before:");
$dumper.dumper($past);

my $result := $binaryPattern.transform($past, fold);

say("After:");
$dumper.dumper($result);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
