#! perl
# Copyright: 2006 The Perl Foundation.  All Rights Reserved.
# $Id: myops.t 10145 2005-11-23 03:15:23Z jonathan $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;
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


pir_output_is(<< 'CODE', << 'OUTPUT', "one alarm");

.sub main :main
    P1 = loadlib "myops_ops"
    find_global P0, "_alarm"
    alarm 2.0, P0
    set I0, 1
loop:
    sleep 1
    print I0
    print "\n"
    inc I0
    # check_events
    le I0, 3, loop
    print "done.\n"
.end

.sub _alarm
    print "alarm\n"
.end
CODE
1
alarm
2
3
done.
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "three alarm");

.sub main :main
    P1 = loadlib "myops_ops"
    find_global P0, "_alarm3"
    alarm 3.3, 0.4, P0
    find_global P0, "_alarm2"
    alarm 2.2, P0
    find_global P0, "_alarm1"
    alarm 1.5, 2.0, P0
    set I0, 1
loop:
    sleep 1
    print I0
    print "\n"
    inc I0
    # check_events
    le I0, 5, loop
    print "done.\n"
.end

.sub _alarm1
    print "alarm1\n"
.end

.sub _alarm2
    print "alarm2\n"
.end

.sub _alarm3
    print "alarm3\n"
.end

CODE
1
alarm1
2
alarm2
3
alarm3
alarm1
alarm3
4
alarm3
alarm3
alarm3
5
done.
OUTPUT
