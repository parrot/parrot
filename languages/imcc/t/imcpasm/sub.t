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
    .local PerlUndef _SV_r23
    _SV_r23 = new PerlUndef
    $P26 = new Sub
    $I15 = addr _sub1
    $P26 = $I15
    _SV_r23 = clone $P26
    invoke _SV_r23
    bsr $I15
    ret
_sub1:
    ret
.end
CODE
/^_main:
 new P0, \d+ # .PerlUndef
 new P1, \d+ # .Sub
 set_addr I0, _sub1
 set P1, I0
 clone P0, P1
 invoke P0
 bsr I0
 ret
_sub1:
 ret/
OUT

output_like(<<'CODE', <<'OUT', "nonlocal bsr");
.sub _main
    .local PerlUndef _SV_r23
    _SV_r23 = new PerlUndef
    $P26 = new Sub
    $I15 = addr _f
    $P26 = $I15
    _SV_r23 = clone $P26
    invoke _SV_r23
    bsr $I15
    ret
.end
.sub _f
    ret
.end
CODE
/^_main:
 new P0, \d+ # .PerlUndef
 new P1, \d+ # .Sub
 set_addr I0, _f
 set P1, I0
 clone P0, P1
 invoke P0
 bsr I0
 ret
_f:
 ret/
OUT
