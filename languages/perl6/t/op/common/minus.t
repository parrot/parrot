#!perl
use strict;
use P6C::TestCompiler tests => 3;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "unary minus, negative numeric context");
    my $result = -5 + 1;	
    print $result, "\n";
CODE
-4
OUT

##############################
output_is(<<'CODE', <<'OUT', "unary minus on second operand");
    my $result = 5 + -1;	
    print $result, "\n";
CODE
4
OUT

##############################
output_is(<<'CODE', <<'OUT', "unary minus in assignment");
    my $result = -5;	
    print $result, "\n";
CODE
-5
OUT
