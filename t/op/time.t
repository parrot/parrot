#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/time.t - Time and Sleep

=head1 SYNOPSIS

	% perl t/op/time.t

=head1 DECSRIPTION

Tests the C<time> and C<sleep> operations.

=cut

use Parrot::Test tests => 4;

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

