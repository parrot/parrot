#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/env.t - System Environment

=head1 SYNOPSIS

	% perl -Ilib t/pmc/env.t

=head1 DESCRIPTION

Tests the C<Env> PMC.

=cut

use Parrot::Test tests => 9;
use Test::More;
use Parrot::Config;


output_is(<<'CODE', <<OUT, "all Envs are ident");
    new P0, .Env
    new P1, .Env
    eq_addr P0, P1, ok
    print "not the same "
ok: print "ok\n"
    end
CODE
ok
OUT

$ENV{"PARROT_TMP"} = "riding a ponie";
output_like(<<'CODE', <<OUT, "getenv");
    new P0, .Env
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/riding a ponie/i
OUT

delete $ENV{"PARROT_TMP"};
output_like(<<'CODE', <<OUT, "setenv/getenv");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/hello polly/i
OUT

output_is(<<'CODE', <<OUT, "envs are all the same");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    set S0, P0["PARROT_TMP"]
    new P1, .Env
    set S1, P1["PARROT_TMP"]
    eq S0, S1, ok
    print "not ok\n"
    end
ok:
    print "ok\n"
    end
CODE
ok
OUT

output_is(<<'CODE', <<OUT, "gone/delete");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    exists I0, P0["PARROT_TMP"]
    if I0, ok1
    print "not "
ok1:
    print "ok 1\n"
    delete P0["PARROT_TMP"]
    set S0, P0["PARROT_TMP"]
    unless S0, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUT

SKIP: {
    # won't work on our unsetenv implementation
    skip("no native unsetenv", 1) unless $PConfig{"unsetenv"};
output_is(<<'CODE', <<OUT, "exists/delete");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    exists I0, P0["PARROT_TMP"]
    if I0, ok1
    print "not "
ok1:
    print "ok 1\n"
    delete P0["PARROT_TMP"]
    exists I0, P0["PARROT_TMP"]
    unless I0, ok2
    print "not "
ok2:
    print "ok 2\n"
    end
CODE
ok 1
ok 2
OUT
}

output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Env
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT

output_is(<<'CODE', <<OUT, "getenv - null key");
    new P0, .Env
    set S0, P0[""]
    eq S0, "", OK
    print "not "
OK: print "ok\n"
    end
CODE
ok
OUT

output_like(<<'CODE', <<OUT, "setenv/getenv - PMC key");
    new P0, .Env
    new P1, .Key
    set P1, "PARROT_TMP"
    new P2, .String
    set P2, "Foobar"
    new P3, .String
    set P0[P1], P2
    set P3, P0[P1]
    print P3
    end
CODE
/Foobar/i
OUT
