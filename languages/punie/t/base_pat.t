#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
    local $TODO = 'unimplemented feature';

    language_output_is( 'punie', <<'EOC', <<'OUT', 'base.pat' );
#!./perl

# $Header: base.pat,v 1.0 87/12/18 13:11:56 root Exp $

print "1..2\n";

# first test to see if we can run the tests.

$_ = 'test';
if (/^test/) { print "ok 1\n"; } else { print "not ok 1\n";}
if (/^foo/) { print "not ok 2\n"; } else { print "ok 2\n";}

EOC
1..2
ok 1
ok 2
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
