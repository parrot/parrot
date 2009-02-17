#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 7;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'simple assignments' );
.sub main			
	a = 1
	b = 1.1
	c = "hello"
	d = e
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'int/hex/bin' );
.sub main			
	a = 10
	b = 0b10
	c = 0x10	
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'get keyed assignments' );
.sub main			
	e = x[1]
	f = x[1.1]
	g = x["hello"]
	h = x[e]	
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'set keyed assignments' );
.sub main			
	x[1]        = 1
	x[1.1]      = 2.222
	x["hello"]	= "hello"
	x[e]        = f
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'simple expressions' );
.sub main			
	.local int x,y,z,a,b,c
	x = 1 + 2
	x = 1 * 2
	y = 2 / 4
	y = 2 - 4
	z = 2 ** 4
	z = 2 % 1
	a = b &  c
	a = b && c
	a = b |  c
	a = b || c
	a = b << c
	a = b >> c
	a = b >>> c
	a = - x
	a = ! x
	a = ~ x
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'assign operators' );
.sub main			
	.local int x
	x = 0
	x += 1
	x *= 5
	x /= 2
	x -= 1
	x %= 2
	x <<= 1
	x >>= 1
	x >>>= 1
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'string charset modifiers' );
.sub main			
	.local string s
	s = ascii:"Hello World"
	s = binary:"Hello WOrld"
	s = unicode:"Hello world"
	s = iso-8859-1:"Hello world"		 
	s = utf8:unicode:"Hello World"
.end
CODE

