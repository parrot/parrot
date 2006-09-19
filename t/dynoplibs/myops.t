#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;
use Parrot::Config;


=head1 NAME

t/dynoplibs/myops.t - Test for the ops in src/dynoplibs/myops.ops

=head1 SYNOPSIS

    % prove t/dynoplibs/myops.t

=head1 DESCRIPTION

Tests the sample dynamic op library "myops".

=cut

my $is_ms_win32 = $^O =~ m!MSWin32!;
my $is_mingw    = $is_ms_win32 && grep { $PConfig{cc} eq $_ } qw(gcc gcc.exe);

pir_output_is(<< 'CODE', << 'OUTPUT', "fortytwo");
.loadlib "myops_ops"
.sub main :main
    $I0 = fortytwo
    print $I0
    print "\n"
.end
CODE
42
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "what_do_you_get_if_you_multiply_six_by_nine");
.loadlib "myops_ops"
.sub main :main
    $S0 = what_do_you_get_if_you_multiply_six_by_nine
    print $S0
    print "\n"
.end
CODE
fortytwo
OUTPUT

pir_output_like(<< 'CODE', << 'OUTPUT', "hcf");
.loadlib "myops_ops"
.sub main :main
    print "neither here\n"
    hcf
    print "nor there\n"
.end
CODE
/neither here
(?!nor there)/
OUTPUT

{
    my $quine = <<'END_PASM';
.loadlib "myops_ops"
q
END_PASM
    pasm_output_is( $quine, $quine, 'a short cheating quine');
}

pir_output_is(<< 'CODE', << 'OUTPUT', "one alarm");
.loadlib "myops_ops"

.sub main :main
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

SKIP: {
    skip "three alarms, infinite loop under mingw32", 1 if $is_mingw;

    pir_output_is(<< 'CODE', << 'OUTPUT', "three alarm");

.loadlib "myops_ops"
.sub main :main
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
}

# bxand boolean op
pasm_output_is(<<'CODE', <<'OUTPUT', 'bxand - A AND B, but not BOTH');
.loadlib "myops_ops"

    bxand I0, 0, 0
    bsr test
    bxand I0, 0, 1
    bsr test
    bxand I0, 1, 0
    bsr test
    bxand I0, 1, 1
    bsr test

    branch end
  test:
    eq I0, 1, T
    print "F\n"
    ret
  T:print "T\n"
    ret
  end:
    end
CODE
F
F
F
F
OUTPUT
