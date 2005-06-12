# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 2;

language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
Hello World
Hallo Welt
CODE
Hello World
Hallo Welt
OUT


language_output_is( 'm4', <<'CODE', <<'OUT', 'hello' );
Hello Earth
Hallo Erde
CODE
Hello Earth
Hallo Erde
OUT
