#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'long sub invocation' );

.sub main :main
	.local int x, y, z
	.pcc_begin
	.arg 1
	.arg 2
	.arg 3
	.pcc_call foo
	.local int a, b, c	
	.result a
	.result b
	.result c
	.pcc_end
.end

.sub foo
	.pcc_begin_return
	.return 4
	.return 5
	.return 6
	.pcc_end_return
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'long sub invocation 2' );

.sub main :main
	.pcc_begin
	.pcc_call foo
	.pcc_end
.end

.sub foo
	.pcc_begin_return
	.pcc_end_return
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'short sub invocation' );

.sub main :main
	.local int x, y, z
	(x, y, z) = foo(1, 2, 3)
	
	foo(1,2,3)
.end

.sub foo
	.return(4, 5, 6)
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'short yield' );

.sub main :main
	.yield(1,2,3)
	.yield()
.end


CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'long yield' );

.sub main :main
	.pcc_begin_yield
	.return 1
	.return 2
	.return 3
	.pcc_end_yield	
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'tail call' );

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
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'tail method call' );

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
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'nci call' );

.sub main :main
	.local pmc x
	.pcc_begin
	.nci_call x
	.pcc_end
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'long method call' );

.sub main :main
	.local pmc x
	.pcc_begin
	.invocant obj
	.meth_call meth
	.pcc_end
.end

CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT
