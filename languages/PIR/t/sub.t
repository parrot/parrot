#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 22;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'basic sub' );
.sub main			
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'main flag' );
.sub main :main	
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'load flag' );
.sub main :load
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'init flag' );
.sub main :init
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'immediate flag' );
.sub main :immediate
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'lex flag' );
.sub main :lex
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'anon flag' );
.sub main :anon
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'outer flag' );

.sub outer_sub
.end

.sub bar :outer(outer_sub)
.end

.sub main :outer('outer_sub')
.end

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 1' );
.sub main :multi(int)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 2' );
.sub main :multi(int, num)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 3' );
.sub main :multi(_, int, num, string, pmc)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 4' );
.sub main :multi(int, _, num, string, _)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 5' );
.sub main :multi(_)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 6' );
.sub main :multi(int, int, int, int)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'multi flag 7' );
.sub main :multi(_, _, _, _, _, _)
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'vtable flag' );
.sub main :vtable('__set_int')
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'combine flags without commas' );
.sub main :main :load :immediate :init
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT



language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'combine flags with commas' );
.sub main :main, :load, :immediate, :init
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'parameters' );
.sub main
	.param pmc pargs
	.param int iarg
	.param string sarg
	.param num narg
	.param object oargs
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'parameter flags' );
.sub main
	.param pmc args1 :slurpy
	.param pmc args2 :named
	.param pmc args3 :optional
	.param int arg3  :opt_flag
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'pcc_sub' );
.pcc_sub x
	.param int i                    # positional parameter
  .param pmc argv :slurpy         # slurpy array
  .param pmc value :named('key')  # named parameter
  .param int x :optional          # optional parameter
  .param int has_x :opt_flag      # flag 0/1 x was passed
  .param pmc kw :slurpy :named    # slurpy hash
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'wrap flag -- new!' );

# This test makes sure pir.pbc is running, not IMCC, as :wrap is still unimplemented and undecided.
.sub x :wrap('y')

.end


CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

