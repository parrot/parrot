#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 6;

##############################
pir_output_is(<<'CODE', <<'OUT', "goto 1");
.sub test :main
	goto foo
	end
foo:
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

##############################
pir_output_is(<<'CODE', <<'OUT', "goto 2");
.sub test :main
	goto foo
bar:	print "ok 2\n"
	end
foo:
	print "ok 1\n"
	goto bar
.end

CODE
ok 1
ok 2
OUT

##############################
pir_output_like(<<'CODE', <<'OUT', "illegal label");
.sub bogus
         bsr _function
         print "never\n"
         end
.end
.sub _function
         bsr FOO
         ret
FOO:    print "in function\n"
         ret
.end
CODE
/no label offset defined/
OUT

pir_output_is(<<'CODE', <<'OUT', "perlish func label");
.sub _main::test
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', "perlish func label - .pcc_sub");
.pcc_sub _main::test
	print "ok 1\n"
	end
.end

CODE
ok 1
OUT

pir_output_is(<<'CODE', <<'OUT', "perlish func label");
.sub _main::test
        _main::sub()
	print "ok 2\n"
	end
.end
.sub _main::sub
	print "ok 1\n"
.end


CODE
ok 1
ok 2
OUT
