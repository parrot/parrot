#!perl
use strict;
use TestCompiler tests => 2;

##############################
# Parrot Calling Conventions

output_is(<<'CODE', <<'OUT', "basic syntax - invokecc, constants");
.sub _main
    .local Sub sub
    newsub sub, .Sub, _sub
    .const int y = 20
    .pcc_begin
    .arg 10
    .arg y
    .pcc_call sub
    ret:
    .pcc_end
    end
.end
.pcc_sub _sub
    .param int a
    .param int b
    print a
    print "\n"
    print b
    print "\n"
    end
.end
CODE
10
20
OUT

##############################
# tail recursion - caller saves - parrot calling convention
output_is(<<'CODE', <<'OUT', "tail recursive sub");
.sub _main
    .local int count
    count = 5
    .local int product
    product = 1
    .local Sub sub
    .local Continuation cc
    newsub sub, .Sub, _fact
    newsub cc, .Continuation, ret
   .pcc_begin
   .arg product
   .arg count
   .pcc_call sub, cc
 ret:
   .local int result
    .result result
    .pcc_end
    print result
    print "\n"
    end
.end

.pcc_sub _fact
   .param int product
   .param int count
   if count <= 1 goto fin
   product = product * count
   dec count
   invoke
fin:
   invoke P1
.end

CODE
120
OUT


