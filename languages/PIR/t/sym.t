#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 5;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'local decls 1' );

.sub main
	.local int a
	.local string b
	.local num c
	.local pmc d
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'local decls 2' );

.sub main
	.local int a, k, l, m
	.local string b, n, o, p
	.local num c, q, r, s
	.local pmc d, t, u
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'local decls - unique_reg' );

.sub main
	.local int a :unique_reg, b, c
	.local num e, f :unique_reg, g
	.local pmc h, i, j :unique_reg
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'sym decls - unique_reg' );

.sub main
	.sym int a :unique_reg, b, c
	.sym num e, f :unique_reg, g
	.sym pmc h, i, j :unique_reg
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'lexicals' );

.sub main
	.local pmc a
	.lex "x", $P0
	.lex "y", a
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


