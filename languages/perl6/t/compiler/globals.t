#!perl

use strict;
use P6C::TestCompiler tests => 1;

##############################
output_is(<<'CODE', <<'OUT', "globals");
sub foo() {
    print $x, " is ", @xs >>~<< ' ', "\n";
    $y = 0;
    for @xs { $y = $y + $_ }
}

sub main() {
    @xs = 1..5;
    $x = 'ex';
    foo;
    print "y is ", $y, "\n";
}
CODE
ex is 1 2 3 4 5 
y is 15
OUT
