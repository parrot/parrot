# $Id$

use strict;

use Test::More tests => 1; 

my $real_out;
my $parrot    = 'cd .. && ./parrot';

$real_out     = `$parrot languages/m4/examples/eval.imc 2>&1`; 
is( $real_out, << 'END_OUT', 'single file' );
1
invoked compiled code
END_OUT
