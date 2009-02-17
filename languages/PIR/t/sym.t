#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'local decls 1' );

.sub main
	.local int a
	.local string b
	.local num c
	.local pmc d
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'local decls 2' );

.sub main
	.local int a, k, l, m
	.local string b, n, o, p
	.local num c, q, r, s
	.local pmc d, t, u
.end

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'local decls - unique_reg' );

.sub main
	.local int a :unique_reg, b, c
	.local num e, f :unique_reg, g
	.local pmc h, i, j :unique_reg
.end

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'lexicals' );

.sub main
	.local pmc a
	.lex "x", $P0
	.lex "y", a
.end

CODE


