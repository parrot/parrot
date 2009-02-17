#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 22;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'basic sub' );
.sub main
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'main flag' );
.sub main :main
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'load flag' );
.sub main :load
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'init flag' );
.sub main :init
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'immediate flag' );
.sub main :immediate
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'lex flag' );
.sub main :lex
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'anon flag' );
.sub main :anon
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'outer flag' );

.sub outer_sub
.end

.sub bar :outer(outer_sub)
.end

.sub main :outer('outer_sub')
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 1' );
.sub main :multi(int)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 2' );
.sub main :multi(int, num)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 3' );
.sub main :multi(_, int, num, string, pmc)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 4' );
.sub main :multi(int, _, num, string, _)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 5' );
.sub main :multi(_)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 6' );
.sub main :multi(int, int, int, int)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 7' );
.sub main :multi(_, _, _, _, _, _)
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'multi flag 8' );
.sub main :multi('Integer', 'Foo')
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'vtable flag' );
.sub main :vtable('__set_int')
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'combine flags without commas' );
.sub main :main :load :immediate :init
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'parameters' );
.sub main
	.param pmc pargs
	.param int iarg
	.param string sarg
	.param num narg
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'parameter flags' );
.sub main
	.param pmc args1 :slurpy
	.param pmc args2 :named
	.param pmc args3 :optional
	.param int arg3  :opt_flag
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'sub' );
.sub x
	.param int i                    # positional parameter
  .param pmc argv :slurpy         # slurpy array
  .param pmc value :named('key')  # named parameter
  .param int x :optional          # optional parameter
  .param int has_x :opt_flag          # flag 0/1 x was passed
  .param pmc kw :slurpy :named    # slurpy hash
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'more parameters' );
.sub x
  .param $P0
  .param $P1 :slurpy
  .param string "y" => a
  .param int "x" => b :slurpy
.end

CODE

