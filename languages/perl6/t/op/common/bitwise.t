#!perl
use strict;
use P6C::TestCompiler tests => 7;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "bitwise AND, numeric");
    my $numeric = 42 +& 18;
    print $numeric ~ "\n";
    my $assign = 42;
    $assign +&= 36;
    print $assign ~ "\n";
CODE
2
32
OUT

##############################
output_is(<<'CODE', <<'OUT', "bitwise AND, string");
    my $string = "j" ~& "g"; # 0b1101010 bitwise OR 0b1100111
    print $string ~ "\n";    # results in 0b1100010
    my $assign = "jj";
    $assign ~&= "gg";
    print $assign ~ "\n";
CODE
b
bb
OUT

##############################
output_is(<<'CODE', <<'OUT', "bitwise OR, numeric");
    my $numeric = 42 +| 18;
    print $numeric ~ "\n";
    my $assign = 42;
    $assign +|= 36;
    print $assign ~ "\n";
CODE
58
46
OUT

##############################
output_is(<<'CODE', <<'OUT', "bitwise OR, string");
    my $string = "a" ~| "b"; # 0b1100001 bitwise OR 0b1100010
    print $string ~ "\n";    # results in 0b1100011
    my $assign = "aa";
    $assign ~|= "bb";
    print $assign ~ "\n";
CODE
c
cc
OUT

##############################
output_is(<<'CODE', <<'OUT', "bitwise XOR, numeric");
    my $numeric = 42 +^ 18;
    print $numeric ~ "\n";
    my $assign = 42;
    $assign +^= 36;
    print $assign ~ "\n";
CODE
56
14
OUT

##############################
output_is(<<'CODE', <<"OUT", "unary bitwise XOR, numeric (bitwise negation/ones complement)");
    my $numeric = +^ 42;
    print $numeric, "\n";
CODE
-43
OUT

##############################
output_is(<<'CODE', <<'OUT', "bitwise XOR, string");
    my $string = "G" ~^ "*" ; # 0b1000111 bitwise XOR 0b0101010
    print $string ~ "\n";     # results in 0b1101101
    my $assign = "GG";
    $assign ~^= "**";
    print $assign ~ "\n";
CODE
m
mm
OUT
