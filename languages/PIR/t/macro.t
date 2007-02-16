#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
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
