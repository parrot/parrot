#!perl
use strict;
use P6C::TestCompiler tests => 4;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "define and use a simple subroutine");
simple("Egad! You astound me, Brain!");
sub simple {
  print @_, "\n";
}
CODE
Egad! You astound me, Brain!
OUT

##############################
output_is(<<'CODE', <<'OUT', "simple subroutine with a single parameter");
simple("Pinky");
sub simple ($param) {
  print $param, "\n";
}
CODE
Pinky
OUT

##############################
output_is(<<'CODE', <<'OUT', "simple subroutine with two parameters");
simple("Narf,", "Poit!");

sub simple ($param1, $param2) {
  print $param1,$param2,"\n";
}
CODE
Narf,Poit!
OUT

##############################
SKIP: {
skip 'no named arguments yet', 1;
output_is(<<'CODE', <<'OUT', "named argument passing");

simple('param'=>"Narf.", 'extra'=>"Poit!");

sub simple ($param) {
  print $param,"\n";
}
CODE
Narf.
OUT
}
