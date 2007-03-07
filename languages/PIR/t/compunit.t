#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 12;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'global defs' );

.global g_X

.global g_Y

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'const defs' );

.const int iConst = 42

.const num nConst = 3.14

.const string sConst = "Hello World"

.const pmc pConst = "is a PMC const a string?"

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT




language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'loadlib directive' );

.loadlib "Hitchhikers"

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'n_operators directive' );

.pragma n_operators 1

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'namespaces 1' );

.namespace ['']
.namespace [""]

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'namespaces 2' );

.namespace ['PIR']
.namespace ["PIR"]

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'namespaces 3' );

.namespace ['PIR';'Grammar']
.namespace ["PIR";"Grammar"]

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'Root namespace' );

.namespace

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'HLL' );

.HLL 'PIR', 'PIRlib'
.HLL "PIR", "PIRlib"

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'HLL map' );

.HLL_map 42, 10

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'source line info' );

.line 42

.line 42, "Hitchhikers.pir"

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'emit' );

.emit
	set P0, 1
.eom

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


