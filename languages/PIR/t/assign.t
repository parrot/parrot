#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'simple assignments' );
.sub main			
	a = 1
	b = 1.1
	c = "hello"
	d = e
.end
CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'get keyed assignments' );
.sub main			
	e = x[1]
	f = x[1.1]
	g = x["hello"]
	h = x[e]	
.end
CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'set keyed assignments' );
.sub main			
	x[1]				= 1
	x[1.1]			= 2.222
	x["hello"]	= "hello"
	x[e]				= f
.end
CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

