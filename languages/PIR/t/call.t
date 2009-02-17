#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 10;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'long sub invocation' );

.sub main :main
    .local int x, y, z
    .begin_call
    .set_arg 1
    .set_arg 2
    .set_arg 3
    .call foo
    .local int a, b, c
    .result a
    .result b
    .result c
    .end_call
.end

.sub foo
    .begin_return
    .return 4
    .return 5
    .return 6
    .end_return
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'long sub invocation 2' );

.sub main :main
    .begin_call
    .call foo
    .end_call
.end

.sub foo
    .begin_return
    .end_return
.end

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'short sub invocation' );

.sub main :main
    .local int x, y, z
    (x, y, z) = foo(1, 2, 3)

    foo(1,2,3)
.end

.sub foo
    .return(4, 5, 6)
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'short yield' );

.sub main :main
    .yield(1,2,3)
    .yield()
.end


CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'long yield' );

.sub main :main
    .begin_yield
    .yield 1
    .yield 2
    .yield 3
    .end_yield
.end

CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'tail call' );

.sub main :main
    .return foo()
.end

.sub foo
    .return bar()
.end

.sub bar
    .return(1)
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'tail method call' );

.sub main :main
    .return obj.foo()
.end

.sub foo
    .return obj.bar()
.end

.sub bar
    .return(1)
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'nci call' );

.sub main :main
    .local pmc x
    .begin_call
    .nci_call x
    .end_call
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'long method call' );

.sub main :main
    .local pmc x
    .begin_call
    .invocant obj
    .meth_call meth
    .end_call
.end

.sub foo
    .local pmc x
    .begin_call
    .invocant obj
    .meth_call 'meth'
    .end_call
.end


CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'short sub call with flags' );

# the sub body is taken from PDD03
.sub main :main
    .local pmc x, y
    foo(x :flat)
    foo(x, 'y' => y)
    foo(x, y :named('y'))
    foo(x :flat :named)
    foo(a, b, c :flat, 'x' => 3, 'y' => 4, z :flat :named('z'))

    x = foo()                       # single result
    (i, j :optional, ar :slurpy, value :named('key') ) = foo()
.end

.sub foo
    .return (i, ar :flat, value :named('key') )
.end

.sub bar
    () = baz()
.end

CODE

