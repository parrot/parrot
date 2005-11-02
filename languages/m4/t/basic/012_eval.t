# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Config;
use Test::More tests => 1; 

my $real_out;
my $parrot    = "cd .. && .$PConfig{slash}parrot$PConfig{exe}";

$real_out     = `$parrot languages/m4/examples/eval.pir 2>&1`; 
is( $real_out, << 'END_OUT', 'single expression' );
Trying to load shared library 'm4_evaluate'.
Trying to load function 'm4_evaluate'.
Evaluating expression: 1 + 1 * 117
evaluated: 118
END_OUT
