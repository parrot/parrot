#!perl
use strict;
use P6C::TestCompiler tests => 2;

##############################
output_is(<<'CODE', <<'OUT', "subroutine call");
sub _fact($tot, $max, $n) {
    if $n > $max {
	print1($max _ "! = " _ $tot);
    } else {
	_fact $tot * $n, $max, $n + 1;
    }
}

sub fact($n) {
    unless 0 <= $n < 20 {
	print1("Sorry, can't take " _ $n _ " factorial");
    } else {
	_fact 1, $n, 1
    }
}

sub main() {
    fact 12;
    fact 14;
    fact -1;
    fact 0;
    fact 24;
}

CODE
12! = 479001600
14! = 1278945280
Sorry, can't take -1 factorial
0! = 1
Sorry, can't take 24 factorial
OUT

##############################
output_is(<<'CODE', <<'OUT', "Argument context");
sub one($x) {
    print1('one ' _$x);
}

sub two($x, $y) {
    print1('two ' _$x _' ' _$y);
}

sub three($x, $y, $z) {
    print1('three ' _$x _' ' _$y _' ' _$z);
}

sub main() {
    one 1, one 2;
    two 1, 2, two 3, 4;
    three 1, 2, 3, one 4, two 5, 6;
}

CODE
one 1
one 2
two 1 2
two 3 4
three 1 2 3
one 4
two 5 6
OUT

