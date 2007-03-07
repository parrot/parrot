#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'macro pasring' );

.sub main
	.local int i
.end

.macro X(a, b)	
	.a = .b
	.local $a:		
.endm


.sub main
	.local int e,f
	.X(e,f)	
.end

.macro X(a,b)
	.local $x: foo()
	
	.local $y:
	.a = .b
	.sym int i
.endm

.sub main
	.X(a,b)
.end


CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'simple macro, no params' );

.macro myMacro
.endm

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'simple macro, params' );

.macro doIt(A,B)
.endm

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', '.constant' );

.constant answer 42

.constant name "Parrot"

.constant x P0
.constant y S1
.constant a I10
.constant b P20

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', '.include' );

.include "Hello"

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


