# $Id$

# pragmata
use strict;

use Test::More tests => 1*1; 

my $real_out;
my $parrot    = '../../parrot';
my $parrot_m4 = "$parrot m4.pbc";

$real_out     = `$parrot examples/eval.imc 2>&1`; 
is( $real_out, << 'END_OUT', 'single file' );
1
invoked compiled code
END_OUT
