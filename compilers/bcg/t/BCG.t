#!perl

use strict;
use warnings;
use lib qw( . ../../../lib);
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 1;

pir_output_is( <<'CODE', <<OUTPUT, "Create the BCG pmc" );
.sub test :main
   loadlib P1, "bcg_group"
    new $P1, "BCG"
.end
CODE
OUTPUT

