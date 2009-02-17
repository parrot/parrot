#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

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
    .label $a:
.endm


.sub main
    .local int e,f
    .X(e,f)
.end

.macro X(a,b)
    .label $x: foo()

    .label $y:
    .a = .b

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

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '.macro_const' );

.macro_const answer 42

.macro_const name "Parrot"

.macro_const x P0
.macro_const y S1
.macro_const a I10
.macro_const b P20

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '.include' );

.include "Hello"

CODE


