#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/tools/m0_interp.t - Test the M0 interpreter prototype

=head1 SYNOPSIS

    % prove t/m0/m0_interp.t - test the interp

=head1 DESCRIPTION

Tests the interpreter.

=cut

use strict;
use warnings;

use Test::More;
use File::Spec::Functions;

plan tests => 1;

ok(1, "bogus placeholder test until we can assemble and run M0");

exit;



my @var_seg = [2, 7, 1];
my $m0_code = <<"M0_CODE";
get_var I1, 0, 0
get_var I2, 0, 1
add_i   I0, I1, I2
get_var I9, 0, 2
say_i   I9, I0, x
M0_CODE
m0_output_is(@var_seg, $m0_code, 9, "basic add_i");


@var_seg = [pack('d', 2), pack('d', 7), 1];
$m0_code = <<"M0_CODE";
get_var N1, 0, 0
get_var N2, 0, 1
add_n   N0, N1, N2

get_var I9, 0, 2
say_n   I9, N0, x
M0_CODE
m0_output_is(@var_seg, $m0_code, 3.0, "basic add_n");


@var_seg = [3, 1, 1];
$m0_code = <<"M0_CODE";
get_var I0, 0, 0
goto    I0, x, x
# the next line should be skipped 
get_var I0, 0, 1
noop

get_var I9, 0, 2
say_n   I9, I0, x
M0_CODE
m0_output_is(@var_seg, $m0_code, 3, "goto");


sub m0_output_is {
    #assemble
    #run
    #check output 
}
