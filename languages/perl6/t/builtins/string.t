#!perl
use strict;
use P6C::TestCompiler tests => 4;
use Test::More qw(skip);

##############################
output_is(<<'CODE', <<'OUT', "substr");

sub f($s) {
    my $t = substr($s, 1, 2);
    print1 $t;
}

sub main() {
    my $s = "abcdefg";
    my $t = substr($s, 1, 2);
    print1 $t;
    f $s;
    my $r = substr($s, 1, 2, "xy");
    print1 $r;
    print1 $s;
    substr($s, 7, 2, "XY");
    print1 $s;
    print1 substr($s, 4);
    print1 substr($s, 1, -2);
    print1 substr($s);
}
CODE
bc
bc
bc
axydefg
axydefg
efg
xyde
wrong number of args for substr
Died (no handler).
OUT

##############################
output_is(<<'CODE', <<'OUT', "length");
sub main() {
    print1(length "abcde");
}
CODE
5
OUT

##############################
output_is(<<'CODE', <<'OUT', "join");
sub main() {
    my $x = 3;
    my $y = 4;
    my $z = join " ", $x, $y;
    print $z, "\n";
    print $x, "\n";
    print $y, "\n";
}
CODE
3 4
3
4
OUT

##############################
output_is(<<'CODE', <<'OUT', "index");
sub main() {
    my $string = "one two three four";
    print index $string, "two";
    print "\n";
    print index $string, "o";
    print "\n";
    print index($string, "o", 9), "\n";
}
CODE
4
0
15
OUT
