#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/env.t - System Environment

=head1 SYNOPSIS

	% perl -Ilib t/pmc/env.t

=head1 DESCRIPTION

Tests the C<Env> PMC.

=cut

use Parrot::Test tests => 12;
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

output_is(<<'CODE', <<OUT, "iterate");
    new P0, .Env
    set P0["PARROT_1"], "hello"
    set P0["PARROT_2"], "polly"
    iter P1, P0
    set I0, 0
loop:
    unless P1, loopend
    shift S2, P1
    eq S2, "PARROT_1", gotit
    eq S2, "PARROT_2", gotit
    branch notit
gotit:
    inc I0
notit:
    branch loop
loopend:
    eq I0, 2, isok
    print "not "
isok:
    print "ok\n"
    end
CODE
ok
OUT


SKIP: {
    # This will not work on our unsetenv implementation
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
};

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub main
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

pir_output_is(<< 'CODE', << 'OUTPUT', "get_integer()");

.sub main
    .local pmc env
    .local int num_before, num_after, num_diff

    # add three more keys in env
    env = new Env
    num_before = env
    env["PARROT_TMP_ADD_1"] = "tmp_add_1"
    env["PARROT_TMP_ADD_2"] = "tmp_add_2"
    env["PARROT_TMP_ADD_3"] = "tmp_add_3"
    num_after = env
    num_diff = num_after - num_before
    print num_diff
    print "\n"
    end
.end
CODE
3
OUTPUT


pir_output_is(<< 'CODE', << 'OUTPUT', "get_number()");

.sub main
    .local pmc env
    .local num num_before, num_after, num_diff

    # add three more keys in env
    env = new Env
    num_before = env
    env["PARROT_TMP_ADD_1"] = "tmp_add_1"
    env["PARROT_TMP_ADD_2"] = "tmp_add_2"
    env["PARROT_TMP_ADD_3"] = "tmp_add_3"
    num_after = env
    num_diff = num_after - num_before
    print num_diff
    print "\n"
    end
.end
CODE
3.000000
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
