# $Id$

use strict;

use Test::More tests => 1; 

my $real_out;
my $parrot    = 'cd .. && ./parrot';

$real_out     = `$parrot languages/m4/examples/eval.imc 2>&1`; 
is( $real_out, << 'END_OUT', 'single expression' );
Trying to load shared library 'm4_eval_compiler'.
Let the init function of the library register the compiler.
Trying to get the registered compiler.
Evaluating expression: 1 + 1 * 117
Invoking compiled code, and receive returned expression
evaluated: 118
END_OUT
