#!/usr/bin/perl
#
# addit.pl
#
use strict;
sub varargs_adder {
    my $sum = 0;
    for (my $a = $#_; $a >= 0; --$a) {
        $sum += $_[$a];
    }
    return $sum
}
my $result = 0;
my @args;
$args[0] = 1000;
$args[1] = 7.100;
$args[2] = 87;
$args[3] = "3.87";
$args[4] = "21000000";
for (my $x = 500000; $x >= 0; --$x) {
    $result = varargs_adder(@args);
}
print "$result\n";
