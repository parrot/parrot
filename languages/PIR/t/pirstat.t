#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'globalconst' );

.sub main
	.globalconst int x = 42
	.globalconst num pi = 3.14
	.globalconst string hi = "hello"	
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'namespace' );

.sub main
	.namespace x
	.endnamespace x
	
	.namespace y
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'const' );

.sub main
	.const int x = 42
	.const num pi = 3.14
	.const string hi = "hello"
.end

CODE

