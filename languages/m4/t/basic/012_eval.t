# $Id$

use strict;

use Test::More tests => 1; 

my $real_out;
my $parrot    = 'cd .. && ./parrot';

$real_out     = `$parrot languages/m4/examples/eval.imc 2>&1`; 
is( $real_out, << 'END_OUT', 'single expression' );
Loading shared library, let the library register the compiler
Getting the compiler
Evaluating expression: 1 + 1 * 117
Invoking compiled code, and receive returned expression
evaluated: 118
END_OUT
