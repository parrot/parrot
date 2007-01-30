#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'simple sub' );
.sub f
.end
CODE
"parse" => PMC 'PIRGrammar' { ... }
Parse successful!
OUT

