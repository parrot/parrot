#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;
use Parrot::Config;


=head1 NAME

t/dynoplibs/dan.t - Test for the ops in src/dynoplibs/dan.ops

=head1 SYNOPSIS

	% prove t/dynoplibs/dan.t

=head1 DESCRIPTION

Tests the sample dynamic op library "dan".

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_ic_nc");
.loadlib "dan_ops"
.sub main :main
    mul $I1, 10, 2.5
    print $I1
    print "\n"
.end
CODE
25
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_i_nc");
.loadlib "dan_ops"
.sub main :main
	$I2 = 10
    mul $I1, $I2, 4.2
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_ic_n");
.loadlib "dan_ops"
.sub main :main
	$N3 = 4.2
    mul $I1, 10, $N3
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_i_n");
.loadlib "dan_ops"
.sub main :main
	$I2 = 10
	$N3 = 4.2
    mul $I1, $I2, $N3
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul pir syntax");
.loadlib "dan_ops"
.sub main :main
	$I2 = 10
	$N3 = 4.2
    $I1 = mul $I2, $N3
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pasm_output_is(<< 'CODE', << 'OUTPUT', "mul pasm syntax");
.loadlib "dan_ops"
    mul I0, 3, 3.9
    print I0
    print "\n"
    end
CODE
11
OUTPUT
