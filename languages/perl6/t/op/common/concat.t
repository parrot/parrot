#!perl
use strict;
use P6C::TestCompiler tests => 2;
use Test::More;

##############################
output_is(<<'CODE', <<'OUT', "concatenation, simple single string");
    print "\"pass " ~ 'test"' ~ "\n"; # backslash quotes + spacing
CODE
"pass test"
OUT

##############################
output_is(<<'CODE', <<'OUT', "concatenation assignment");
    my $string = "Narf, ";
    $string ~= "Poit!\n";
    print $string;
CODE
Narf, Poit!
OUT
