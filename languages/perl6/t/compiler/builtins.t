#!perl
use strict;
use P6C::TestCompiler tests => 2;
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
output_is(<<'CODE', <<'OUT', "substr");

sub main() {
  print1(length("abcde"));
}
CODE
5
OUT

