#!perl
use strict;
use TestCompiler tests => 2;

##############################
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
 new P(\d+), \d+ # \.Sub
 set_addr I(\d+), _sub1
 set P\1, I\2
 invoke P\1
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
 new P(\d+), \d+ # \.Sub
 set_addr I(\d+), _f
 set P\1, I\2
 invoke P\1
 ret
_f:
 ret/
OUT
