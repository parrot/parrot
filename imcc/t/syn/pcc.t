#!perl
use strict;
use TestCompiler tests => 1;

##############################
# Parrot Calling Conventions


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


