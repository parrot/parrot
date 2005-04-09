#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 15;

pir_output_is(<<'CODE', <<'OUT', "if/unless");
.sub test @MAIN
	$I0 = 0
	if $I0 goto nok1
	print "ok 1\n"
nok1:
	unless $I0 goto ok1
	print "nok 1\n"
ok1:
	if I0, nok2
	print "ok 2\n"
nok2:
	unless I0 goto ok2
	print "nok 2\n"
ok2:
	end
.end
CODE
ok 1
ok 2
OUT

pir_output_is(<<'CODE', <<'OUT', "if/unless");
.sub test @MAIN
	$I0 = 0
	$I1 = 1
	if $I0 == $I1 goto nok1
	print "ok 1\n"
nok1:
	unless $I0 == $I1 goto ok1
	print "nok 1\n"
ok1:
	if I0, nok2
	print "ok 2\n"
nok2:
	unless I0 goto ok2
	print "nok 2\n"
ok2:
	unless $I0 > $I1 goto ok3
	print "not "
ok3:	print "ok 3\n"
	end
.end
CODE
ok 1
ok 2
ok 3
OUT


pir_output_is(<<'CODE', <<'OUT', "new");
.sub test @MAIN
	$P1 = new String
	$P1 = "ok 1\n"
	new P1, .String
	set P1, "ok 2\n"
	print $P1
	print P1
	end
.end
CODE
ok 1
ok 2
OUT


pir_output_is(<<'CODE', <<'OUT', "clone");
.sub test @MAIN
	$P1 = new String
	$P1 = "ok 1\n"
	$P0 = clone $P1
	new P1, .String
	set P1, "ok 2\n"
	clone P0, P1
	print $P0
	print P0
	end
.end
CODE
ok 1
ok 2
OUT


pir_output_is(<<'CODE', <<'OUT', "defined");
.sub test @MAIN
	$P1 = new Hash
	$I0 = defined $P1
	new P1, .Hash
	defined I0, P1
	print $I0
	print "\n"
	print I0
	print "\n"
	end
.end
CODE
1
1
OUT


pir_output_is(<<'CODE', <<'OUT', "defined keyed");
.sub test @MAIN
	$P1 = new Hash
	$P1["a"] = "ok 1\n"
	$I0 = defined $P1["a"]
	new P1, .Hash
	set P1["a"], "ok 2\n"
	defined I0, P1["a"]
	defined I1, P1["b"]
	print $I0
	print "\n"
	print I0
	print "\n"
	print I1
	print "\n"
	end
.end
CODE
1
1
0
OUT


pir_output_is(<<'CODE', <<'OUT', "parrot op as identifier");
.sub test @MAIN
	.local int set
	set = 5
	print set
	print "\n"
	inc set
	print set
	print "\n"
	end
.end
CODE
5
6
OUT


pir_output_is(<<'CODE', <<'OUT', "parrot op as label");
.sub test @MAIN
	goto set
set:
	if I0, err
	if I0 goto err
	inc I0
	unless I0, err
	unless I0 goto err
	print "ok\n"
	end
err:
	print "nok\n"
	end
.end

CODE
ok
OUT

pir_output_like(<<'CODE', <<'OUTPUT', "new with a native type");
.sub test @MAIN
        $P1 = new INTVAL
	print "never\n"
	end
.end
CODE
/error:\w+:Unknown PMC type 'INTVAL'/
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "setline w comment");
.sub test @MAIN
    setline 1	# comment
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "setfile w comment");
.sub test @MAIN
    setfile "foo"	# comment
    print "ok\n"
    end
.end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "eq_num => eq");
.sub test @MAIN
    .local int i
    .local int j
    i = 1
    j = 1
    eq_num i, j, ok1
    print "not "
ok1:
    print "ok 1\n"
    end
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "eq_num => eq mixed => eq_n_n");
.sub test @MAIN
    .local int i
    .local float j
    i = 1
    j = 1.0
    eq_num j, i, ok1
    print "not "
ok1:
    print "ok 1\n"
    end
.end
CODE
ok 1
OUTPUT

pir_output_like(<<'CODE', <<'OUT', "undefined ident");
.sub test @MAIN
    print no_such
.end
CODE
/error.*undefined.*'no_such'/
OUT

pir_output_is(<<'CODE', <<'OUT', "label ident");
.sub test @MAIN
    branch no_such
    end
no_such:
    print "ok\n"
.end
CODE
ok
OUT
