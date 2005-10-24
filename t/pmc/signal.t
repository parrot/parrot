#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/signal.t - Signal Handling

=head1 SYNOPSIS

	% perl -Ilib t/pmc/signal.t

=head1 DESCRIPTION

Tests signal handling.

=cut

use Parrot::Test;
use Test::More;
use strict;

# actually more platforms should work - all POSIX compliant ones - but
# signals are currently not enabled for all in src/events.c
# a second problem is to get the test doing the right thing: mainly figuring
# out what PID to kill. The "ps" command isn't one of the portable ones.

my %platforms = map {$_=>1} qw/
    darwin
    hpux
    linux
    cygwin
/;

if ($platforms{$^O}) {
    #plan tests => 3;
    plan skip_all => 'Signals currently diabled';
}
else {
    plan skip_all => 'No events yet';
}

#
# A SIGHUP is sent to parrot from the alarm handler
# This is a non-portable hack.

my $pid;

sub parrot_pids {
    grep { !/harness/ && !/sh -c/ } `ps axw | grep '[p]arrot'`;
}

sub send_SIGHUP {
    $SIG{ALRM} = sub {
	# get PID of parrot
       my @ps = parrot_pids;
	die 'no output from ps' unless @ps;
	# the IO thread parrot process
	# on linux 2.2.x there are 4 processes, last is the IO thread
        # posix compliant threads have exactly one PID for parrot
	my $io_thread = pop @ps;
	if ($io_thread =~ /^\s*(\d+)/) {
	    $pid = $1;
	    # send a
	    kill 'SIGHUP', $pid;
	}
	else {
	    die 'no pid found for parrot';
	}
    };
    alarm 1;
}

sub check_running {
    select undef, undef, undef, 0.1;
    my @ps = parrot_pids;
    my $thread = pop @ps;
    if ($thread =~ /^\s*(\d+)/ && $1 == $pid) {
	ok(0, "parrot $pid still running");
    }
    else {
        ok(1, 'parrot stopped');
    }
}

send_SIGHUP;

output_is(<<'CODE', <<'OUTPUT', "SIGHUP event - sleep");
    print "start\n"
    # no exception handler - parrot should die silently
    sleep 2
    print "never\n"
    end
CODE
start
OUTPUT

# check_running;

send_SIGHUP;

output_is(<<'CODE', <<'OUTPUT', "SIGHUP event - loop");
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

# check_running;


SKIP: {
  skip("works standalone but not in test", 1);
send_SIGHUP;

output_is(<<'CODE', <<'OUTPUT', "SIGHUP event - sleep, catch");
    push_eh _handler
    print "start\n"
    sleep 2
    print "never\n"
    end
_handler:
.include "signal.pasm"
    print "catched "
    set I0, P5["_type"]
    neg I0, I0
    ne I0, .SIGHUP, nok
    print "SIGHUP\n"
    end
nok:
    print "something _type = "
    neg I0, I0
    print I0
    print "\n"
    end

CODE
start
catched SIGHUP
OUTPUT

# check_running;
}
