#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 7;

pir_output_is(<<'CODE', <<'OUT', "globalconst 1");

.sub __main
	.globalconst int N = 5
	call _main
	end
.end

.sub _sub1
	print N
	print "\n"
	ret
.end

.sub _main
	call _sub1
	ret
.end
CODE
5
OUT

pir_output_is(<<'CODE', <<'OUT', "globalconst 2");
.sub test @MAIN
	.globalconst int N = 5
	call _main
	end
.end

.sub _sub1
	.local int x
	x = 10 + N
	print x
	print "\n"
	ret
.end

.sub _main
	call _sub1
	ret
.end
CODE
15
OUT

pir_output_is(<<'CODE', <<'OUT', "globalconst 3");

.sub call_sub1
    sub1()
.end

.sub test @MAIN
    .globalconst int N = 5
    call_sub1()
.end

.sub sub1
    print N
    print "\n"
.end

CODE
5
OUT


pir_output_is(<<'CODE', <<'OUT', "array/hash consts");
.sub _MAIN
   .local PerlArray ar
   .local pmc ha
   .local string key1
   .const string key2 = "key2"
   .local int idx1
   .const int idx2 = 2
   ar = new PerlArray
   ha = new Hash
   key1 = "key1"
   idx1 = 1
   ha[key1] = idx1
   ha[key2] = idx2
   $I0 = ha[key1]
   $I1 = ha[key2]
   ar[idx1] = $I0
   ar[idx2] = $I1
   $I2 = ar[idx1]
   $I3 = ar[idx2]
   print $I2
   print $I3
   print "\n"
   end
.end
CODE
12
OUT


pir_output_is(<<'CODE', <<'OUT', "escaped");
.sub _MAIN
   $S0 = "\""
   print $S0
   print "\\"
   $S0 = "\"\\\"\n"
   print $S0
  end
.end
CODE
"\"\"
OUT


pir_output_is(<<'CODE', <<'OUT', "PMC const 1 - Sub");
.sub main @MAIN
    .const .Sub $P0 = "foo"
    print "ok 1\n"
    $P0()
    print "ok 3\n"
.end
.sub foo
    print "ok 2\n"
.end
CODE
ok 1
ok 2
ok 3
OUT


pir_output_is(<<'CODE', <<'OUT', "PMC const 2 - Sub ident");
.sub main @MAIN
    .const .Sub func = "foo"
    print "ok 1\n"
    func()
    print "ok 3\n"
.end
.sub foo
    print "ok 2\n"
.end
CODE
ok 1
ok 2
ok 3
OUT
