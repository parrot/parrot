#!perl
# Copyright (C) 2001-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;

=head1 NAME

t/op/time.t - Time and Sleep

=head1 SYNOPSIS

    % prove t/op/time.t

=head1 DESCRIPTION

Tests the C<time> and C<sleep> operations.

=cut

pasm_output_is( <<'CODE', <<'OUTPUT', "time_i" );
        time    I0
        time    I1
        ge      I0, 0, OK1
        branch  FAIL
OK1:    print "ok, (!= 1970) Grateful Dead not\n"
        ge      I1, I0, OK2
        branch FAIL
OK2:    print "ok, (now>before) timelords need not apply\n"
        branch  OK_ALL
FAIL:   print "failure\n"
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

pasm_output_is( <<'CODE', <<'OUTPUT', "time_n" );
        time    N0
        time    N1
        ge      N0, 0.0, OK1
        branch  FAIL
OK1:    print "ok, (!= 1970) Grateful Dead not\n"
        ge      N1, N0, OK2
        branch FAIL
OK2:    print "ok, (now>before) timelords need not apply\n"
        branch  OK_ALL
FAIL:   print "failure\n"
OK_ALL:
        end
CODE
ok, (!= 1970) Grateful Dead not
ok, (now>before) timelords need not apply
OUTPUT

pasm_output_is( <<CODE, <<OUTPUT, "sleep" );
        print   "start\\n"

        time    I1

        sleep   1
        set     I0, 1
        sleep   I0

        time    I0

        gt      I0, I1, ALLOK
        print   "no, sleeping made time go the wrong way "

ALLOK:
        print   "done\\n"
        end
CODE
start
done
OUTPUT

pasm_error_output_like( <<CODE, <<OUT , "sleep" );
        sleep   -1
        end
CODE
/Cannot go back in time/
OUT

my $year;
( undef, undef, undef, undef, undef, $year ) = localtime();
$year += 1900;

# don't run this test 1 tick before the year changes #'

pasm_output_is( <<'CODE', $year, "decodelocaltime" );
    time I0
    decodelocaltime P0, I0
    .include "tm.pasm"
    set I0, P0[.TM_YEAR]
    print I0
    end
CODE

pir_output_is(<<'CODE', "Tue Jan  1 00:00:00 2008\n25", "gmtime string length");
.sub _ :main
$I0 = 1199145600
$S0 = gmtime $I0
print $S0
$I1 = length $S0
print $I1
.end
CODE

pir_output_is(<<'CODE', <<OUTPUT, "time(FLOATVAL) vs time(INTVAL)");
.sub main :main
    .local int time_int
    time time_int

    .local num time_float
    time time_float

    # check if time_float is within [time_int - 5;time_int + 5]
    .local int time_int_lower
    time_int_lower = time_int - 5
    if time_float < time_int_lower goto FAIL
    .local int time_int_upper
    time_int_upper = time_int + 5
    if time_float > time_int_upper goto FAIL

    print "ok\n"
    goto END

FAIL: print "not ok\n"
    goto END

END:
.end
CODE
ok
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
