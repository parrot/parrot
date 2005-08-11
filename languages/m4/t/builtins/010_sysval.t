# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Config;
use Parrot::Test tests => 1 + 1;

my $true  = "$PConfig{perl} -e exit(0)";
my $false = "$PConfig{perl} -e exit(1)";

SKIP:
{
  skip( "difference between running a process in a fork, or with system()", 1 );
  language_output_is( 'm4', <<'CODE', <<'OUT', 'output of "false"' );
syscmd(`$false`)
sysval()
CODE

1
OUT
}

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'output of "true"' );
syscmd(`$true')
sysval()
CODE

0
OUT
}
