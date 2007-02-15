#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'globalconst' );

.sub main
	.globalconst int x = 42
	.globalconst num pi = 3.14
	.globalconst string hi = "hello"	
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'namespace' );

.sub main
	.namespace x
	.endnamespace x
	
	.namespace y
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'const' );

.sub main
	.const int x = 42
	.const num pi = 3.14
	.const string hi = "hello"
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

