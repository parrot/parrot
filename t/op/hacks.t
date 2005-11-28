#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;
use Config;


=head1 NAME

t/op/hacks.t - IO Ops

=head1 SYNOPSIS

	% prove t/op/hacks.t

=head1 DESCRIPTION

Tests basic file IO operations.

=cut


sub has_signal {
  my $sig = shift;
  foreach my $name (split(' ', $Config{sig_name})) {
    return 1 if ("SIG$name" eq $sig);
  }
  return 0;
}

SKIP: {
  skip("no universal SIGFPE handling", 2);

output_is(<<'CODE', <<OUT, "catch a SIGFPE");
    push_eh _handler
    div I10, 0
    print "not reached\n"
    end
_handler:
    print "catched it\n"
    set I0, P5["_type"]
    print "error "
    print I0
    print "\n"
    set I0, P5["_severity"]
    print "severity "
    print I0
    print "\n"
    end
# SIGFPE = 8
CODE
catched it
error -8
severity 0
OUT

output_is(<<'CODE', <<OUT, "catch a SIGFPE 2");
    push_eh _handler
    div I10, 0
    print "not reached\n"
    end
_handler:
.include "signal.pasm"
    print "catched it\n"
    set I0, P5["_type"]
    neg I0, I0
    ne I0, .SIGFPE, nok
    print "ok\n"
nok:
    end
CODE
catched it
ok
OUT
}


## remember to change the number of tests :-)
BEGIN { plan tests => 2; }
