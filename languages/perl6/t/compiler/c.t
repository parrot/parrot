#!perl
use strict;
use P6C::TestCompiler tests => 6;
use Test::More;

##############################

SKIP: {
skip("running on a perl that does not understand 0b... notation", 1)
    if $] < 5.006;
output_is(<<'CODE', <<'OUT', "Binary");
sub main() {
	print 0b0110;
	print "\n";
	print -0b0110;
	print "\n";
}
CODE
6
-6
OUT
}

##############################

output_is(<<'CODE', <<'OUT', "Octal");
sub main() {
	print 0c0777;
	print "\n";
	print -0c0777;
	print "\n";
}
CODE
511
-511
OUT

##############################

output_is(<<'CODE', <<'OUT', "Decimal");
sub main() {
	print 0d0789;
	print "\n";
	print -0d0789;
	print "\n";
}
CODE
789
-789
OUT


##############################

output_is(<<'CODE', <<'OUT', "Simple Radii");
sub main() {
	#binary
	$a = 2#101110;
	print $a;
	print "\n";

	#tertiary
	$b = 3#1210112;
	print $b;
	print "\n";

	#octal
	$c = 8#1270;
	print $c;
	print "\n";

	#hexadecimal
	$d = 16#1E3A7;
	print $d;
	print "\n";
}
CODE
46
1310
696
123815
OUT

##############################

output_is(<<'CODE', <<'OUT', "High Range Radii");
sub main() {
	$a = 20#1gj;
	print $a;
	print "\n";
	$b = 20#1GJ;
	print $b;
	print "\n";
}
CODE
739
739
OUT

##############################

output_is(<<'CODE', <<'OUT', "\"Dotted Notation\"");
sub main() {
	$a = 12#10:11:10;
	print $a;
	print "\n";

	$d = 256#254:253;
	print $d;
	print "\n";
}
CODE
1582
65277
OUT
