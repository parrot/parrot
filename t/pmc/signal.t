#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/signal.t - Signal Handling

=head1 SYNOPSIS

	% perl t/pmc/signal.t

=head1 DECSRIPTION

Tests signal handling. All test are skipped unless running on Linux.

=cut

use Parrot::Test;
use Test::More;
use strict;

my %platforms = map {$_=>1} qw/
    hpux
    linux
/;

if ($platforms{$^O}) {
    plan tests => 3 * 2;
}
else {
    plan skip_all => 'No events yet';
}

#
# A SIGINT is sent to parrot from the alarm handler
# This is a non-portable hack.

my $pid;

sub send_SIGINT {
    $SIG{ALRM} = sub {
	# get PID of parrot
	my @ps = `ps -C parrot -o pid`;
	die 'no output from ps' unless @ps;
	# the IO thread parrot process
	# on 2.2.x there are 4 processes, last is the IO thread
	my $io_thread = pop @ps;
	if ($io_thread =~ /^\s*(\d+)/) {
	    $pid = $1;
	    # send a SIGINT
	    kill 'SIGINT', $pid;
	}
	else {
	    die 'no pid found for parrot';
	}
    };
    alarm 1;
}

sub check_running {
    select undef, undef, undef, 0.1;
    my @ps = `ps | grep [p]arrot`;
    my $thread = pop @ps;
    if ($thread =~ /^\s*(\d+)/ && $1 == $pid) {
	ok(0, "parrot $pid still running");
    }
    else {
        ok(1, 'parrot stopped');
    }
}

send_SIGINT;

output_is(<<'CODE', <<'OUTPUT', "SIGINT event - sleep");
    print "start\n"
    # no exception handler - parrot should die silently
    sleep 2
    print "never\n"
    end
CODE
start
OUTPUT

check_running;

send_SIGINT;

output_is(<<'CODE', <<'OUTPUT', "SIGINT event - loop");
    bounds 1 # no JIT
    print "start\n"
    # no exception handler - parrot should die silently

lp: dec I20
    if I20, lp
    # if 4G loops take less then 1 second, this will fail :)
    print "never\n"
    end
CODE
start
OUTPUT

check_running;


SKIP: {
  skip("works standalone but not in test", 2);
send_SIGINT;

output_is(<<'CODE', <<'OUTPUT', "SIGINT event - sleep, catch");
    newsub P20, .Exception_Handler, _handler
    set_eh P20
    print "start\n"
    sleep 2
    print "never\n"
    end
_handler:
.include "signal.pasm"
    print "catched "
    set I0, P5["_type"]
    neg I0, I0
    ne I0, .SIGINT, nok
    print "SIGINT\n"
    end
nok:
    print "something _type = "
    neg I0, I0
    print I0
    print "\n"
    end

CODE
start
catched SIGINT
OUTPUT

check_running;
}
