#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/time.t - Time and Sleep

=head1 SYNOPSIS

	% prove t/op/time.t

=head1 DESCRIPTION

Tests the C<time> and C<sleep> operations.

=cut


output_is(<<'CODE', <<'OUTPUT', "time_i");
	time	I0
	time	I1
	ge	I0, 0, OK1
	branch	FAIL
OK1:	print "ok, (!= 1970) Grateful Dead not\n"
	ge	I1, I0, OK2
	branch FAIL
OK2:	print "ok, (now>before) timelords need not apply\n"
	branch	OK_ALL
FAIL:	print "failure\n"
	print "I0 was: "
	print I0
	print "\nI1 was: "
	print I0
	print "\n"
OK_ALL:
	end
CODE
ok, (!= 1970) Grateful Dead not
ok, (now>before) timelords need not apply
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "time_n");
	time	N0
	time	N1
	ge	N0, 0.0, OK1
	branch	FAIL
OK1:	print "ok, (!= 1970) Grateful Dead not\n"
	ge	N1, N0, OK2
	branch FAIL
OK2:	print "ok, (now>before) timelords need not apply\n"
	branch	OK_ALL
FAIL:	print "failure\n"
OK_ALL:
	end
CODE
ok, (!= 1970) Grateful Dead not
ok, (now>before) timelords need not apply
OUTPUT

output_is(<<CODE, <<OUTPUT, "sleep");
	print	"start\\n"

	time	I1

	sleep	1
	set	I0, 1
	sleep	I0

	time	I0

	gt	I0, I1, ALLOK
	print	"no, sleeping made time go the wrong way "

ALLOK:
	print	"done\\n"
	end
CODE
start
done
OUTPUT

output_like(<<CODE, <<OUT , "sleep");
	sleep	-1
	end
CODE
/Cannot go back in time/
OUT

my $year;
(undef, undef, undef, undef, undef, $year) = gmtime(time);
$year += 1900;

# don't run this test 1 tick before the year changes #'

output_is(<<'CODE', $year, "decodelocaltime");
    time I0
    decodelocaltime P0, I0
    .include "tm.pasm"
    set I0, P0[.TM_YEAR]
    print I0
    end
CODE


## remember to change the number of tests :-)
BEGIN { plan tests => 5; }

