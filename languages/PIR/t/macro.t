#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'macro pasring' );

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

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'simple macro, no params' );

.macro myMacro
.endm

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'simple macro, params' );

.macro doIt(A,B)
.endm

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '.constant' );

.constant answer 42

.constant name "Parrot"

.constant x P0
.constant y S1
.constant a I10
.constant b P20

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '.include' );

.include "Hello"

CODE


