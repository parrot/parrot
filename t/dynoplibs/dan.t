#! perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: dan.t 10145 2005-11-23 03:15:23Z jonathan $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;
use Parrot::Config;


=head1 NAME

t/dynoplibs/dan.t - Test for the ops in src/dynoplibs/dan.ops

=head1 SYNOPSIS

	% prove t/dynoplibs/dan.t

=head1 DESCRIPTION

Tests the sample dynamic op library "dan".

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "load");
.sub main :main
    loadlib P1, "dan_ops"
    print P1
    print "\n"
.end
CODE
dan_ops
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_ic_nc");
.sub main :main
    loadlib P1, "dan_ops"
    mul $I1, 10, 2.5
    print $I1
    print "\n"
.end
CODE
25
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_i_nc");
.sub main :main
    loadlib P1, "dan_ops"
	$I2 = 10
    mul $I1, $I2, 4.2
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_ic_n");
.sub main :main
    loadlib P1, "dan_ops"
	$N3 = 4.2
    mul $I1, 10, $N3
    print $I1
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "mul_i_i_n");
.sub main :main
    loadlib P1, "dan_ops"
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
.sub main :main
    loadlib P1, "dan_ops"
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
    loadlib P0, "dan_ops"
    mul I0, 3, 3.9
    print I0
    print "\n"
    end
CODE
11
OUTPUT
