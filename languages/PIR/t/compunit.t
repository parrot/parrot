#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 11;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'const defs' );

.const int iConst = 42

.const num nConst = 3.14

.const string sConst = "Hello World"

.const pmc pConst = "is a PMC const a string?"

CODE




language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'loadlib directive' );

.loadlib "Hitchhikers"

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'n_operators directive' );

.pragma n_operators 1

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'namespaces 1' );

.namespace ['']
.namespace [""]

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'namespaces 2' );

.namespace ['PIR']
.namespace ["PIR"]

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'namespaces 3' );

.namespace ['PIR';'Grammar']
.namespace ["PIR";"Grammar"]

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'Root namespace' );

.namespace []

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'HLL' );

.HLL 'PIR', 'PIRlib'
.HLL "PIR", "PIRlib"

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'HLL map' );

.HLL_map "Integer", "FooNumber"

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'source line info' );

.line 42

.line 42, "Hitchhikers.pir"

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'emit' );

.emit
	set P0, 1
.eom

CODE
