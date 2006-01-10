#! perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: myops.t 10145 2005-11-23 03:15:23Z jonathan $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;
use Parrot::Config;


=head1 NAME

t/dynoplibs/myops.t - Test for the ops in src/dynoplibs/myops.ops

=head1 SYNOPSIS

	% prove t/dynoplibs/myops.t

=head1 DESCRIPTION

Tests the sample dynamic op library "myops".

=cut


pir_output_is(<< 'CODE', << 'OUTPUT', "load");
.sub main :main
    loadlib P1, "myops_ops"
    print P1
    print "\n"
.end
CODE
myops_ops
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "fortytwo");
.sub main :main
    loadlib P1, "myops_ops"
    $I0 = fortytwo
	print $I0
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "what_do_you_get_if_you_multiply_six_by_nine");
.sub main :main
    loadlib P1, "myops_ops"
    $S0 = what_do_you_get_if_you_multiply_six_by_nine
	print $S0
    print "\n"
.end
CODE
fortytwo
OUTPUT
