#!perl
use strict;
use TestCompiler tests => 3;

##############################
output_is(<<'CODE', <<'OUT', "nested sub");
.sub __main
	bsr _sub1
	bsr _sub2
	end
.end
.sub _sub1
	print "ok 1\n"
    .sub _sub3
        print "ok 2\n"
	ret
    .end
        bsr _sub3
	print "ok 3\n"
	ret
.end
.sub _sub2
	print "ok 4\n"
	ret
.end
CODE
__main:
	bsr _sub1
	bsr _sub2
	end
_sub3:
	print "ok 2\n"
	ret
_sub1:
	print "ok 1\n"
	bsr _sub3
	print "ok 3\n"
	ret
_sub2:
	print "ok 4\n"
	ret
OUT

output_like(<<'CODE', <<'OUT', "non-constant dest bsr, invoke");
.sub _main
    $P26 = new Sub
    $I15 = addr _sub1
    $P26 = $I15
    invoke $P26
    ret
_sub1:
    ret
.end
CODE
/^_main:
 new P16, \d+ # .Sub
 set_addr I16, _sub1
 set P16, I16
 invoke P16
 ret
_sub1:
 ret/
OUT

output_like(<<'CODE', <<'OUT', "nonlocal bsr");
.sub _main
    $P26 = new Sub
    $I15 = addr _f
    $P26 = $I15
    invoke $P26
    ret
.end
.sub _f
    ret
.end
CODE
/^_main:
 new P16, \d+ # .Sub
 set_addr I16, _f
 set P16, I16
 invoke P16
 ret
_f:
 ret/
OUT
